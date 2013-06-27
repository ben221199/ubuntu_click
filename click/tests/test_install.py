# Copyright (C) 2013 Canonical Ltd.
# Author: Colin Watson <cjwatson@ubuntu.com>

# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation; version 3 of the License.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.

"""Unit tests for click.install."""

from __future__ import print_function

__metaclass__ = type
__all__ = [
    'TestClickInstaller',
    ]


import json
import os
import stat
import subprocess

from contextlib import closing

try:
    from unittest import mock
except ImportError:
    import mock
from unittest import skipUnless


from debian.deb822 import Deb822
# BAW 2013-04-16: Get the DebFile class from here because of compatibility
# issues.  See the comments in that module for details.
from click.install import DebFile

from click import osextras
from click.install import ClickInstaller, ClickInstallerPermissionDenied
from click.preinst import static_preinst
from click.tests.helpers import TestCase, mkfile, touch


def mock_quiet_subprocess_call():
    original_call = subprocess.call

    def side_effect(*args, **kwargs):
        if "TEST_VERBOSE" in os.environ:
            return original_call(*args, **kwargs)
        else:
            with open("/dev/null", "w") as devnull:
                return original_call(
                    *args, stdout=devnull, stderr=devnull, **kwargs)

    return mock.patch("subprocess.call", side_effect=side_effect)


class TestClickInstaller(TestCase):
    def setUp(self):
        super(TestClickInstaller, self).setUp()
        self.use_temp_dir()

    def make_fake_package(self, control_fields=None, manifest=None,
                          control_scripts=None, data_files=None):
        """Build a fake package with given contents.

        We can afford to use dpkg-deb here since it's easy, just for testing.
        """
        control_fields = {} if control_fields is None else control_fields
        control_scripts = {} if control_scripts is None else control_scripts
        data_files = [] if data_files is None else data_files

        package_dir = os.path.join(self.temp_dir, "fake-package")
        control_dir = os.path.join(package_dir, "DEBIAN")
        with mkfile(os.path.join(control_dir, "control")) as control:
            for key, value in control_fields.items():
                print('%s: %s' % (key.title(), value), file=control)
            print(file=control)
        if manifest is not None:
            with mkfile(os.path.join(control_dir, "manifest")) as f:
                print(json.dumps(manifest), file=f)
        for name, contents in control_scripts.items():
            with mkfile(os.path.join(control_dir, name)) as script:
                script.write(contents)
        for name in data_files:
            touch(os.path.join(package_dir, name))
        package_path = '%s.click' % package_dir
        with open("/dev/null", "w") as devnull:
            env = dict(os.environ)
            env["NO_PKG_MANGLE"] = "1"
            subprocess.check_call(
                ["dpkg-deb", "--nocheck", "-b", package_dir, package_path],
                stdout=devnull, stderr=devnull, env=env)
        return package_path

    def make_framework(self, installer, name):
        installer.frameworks_dir = os.path.join(self.temp_dir, "frameworks")
        osextras.ensuredir(installer.frameworks_dir)
        touch(os.path.join(installer.frameworks_dir, "%s.framework" % name))

    def test_audit_control_no_click_version(self):
        path = self.make_fake_package()
        with closing(DebFile(filename=path)) as package:
            self.assertRaisesRegex(
                ValueError, "No Click-Version field",
                ClickInstaller(self.temp_dir).audit_control, package.control)

    def test_audit_control_bad_click_version(self):
        path = self.make_fake_package(control_fields={"Click-Version": "|"})
        with closing(DebFile(filename=path)) as package:
            self.assertRaises(
                ValueError,
                ClickInstaller(self.temp_dir).audit_control, package.control)

    def test_audit_control_new_click_version(self):
        path = self.make_fake_package(control_fields={"Click-Version": "999"})
        with closing(DebFile(filename=path)) as package:
            self.assertRaisesRegex(
                ValueError,
                "Click-Version: 999 newer than maximum supported version .*",
                ClickInstaller(self.temp_dir).audit_control, package.control)

    def test_audit_control_forbids_depends(self):
        path = self.make_fake_package(
            control_fields={
                "Click-Version": "0.1",
                "Depends": "libc6",
            })
        with closing(DebFile(filename=path)) as package:
            installer = ClickInstaller(self.temp_dir)
            self.make_framework(installer, "ubuntu-sdk-13.10")
            self.assertRaisesRegex(
                ValueError, "Depends field is forbidden in Click packages",
                installer.audit_control, package.control)

    def test_audit_control_forbids_maintscript(self):
        path = self.make_fake_package(
            control_fields={"Click-Version": "0.1"},
            control_scripts={
                "preinst": "#! /bin/sh\n",
                "postinst": "#! /bin/sh\n",
            })
        with closing(DebFile(filename=path)) as package:
            installer = ClickInstaller(self.temp_dir)
            self.make_framework(installer, "ubuntu-sdk-13.10")
            self.assertRaisesRegex(
                ValueError,
                r"Maintainer scripts are forbidden in Click packages "
                r"\(found: postinst preinst\)",
                installer.audit_control, package.control)

    def test_audit_control_requires_manifest(self):
        path = self.make_fake_package(
            control_fields={"Click-Version": "0.1"},
            control_scripts={"preinst": static_preinst})
        with closing(DebFile(filename=path)) as package:
            installer = ClickInstaller(self.temp_dir)
            self.make_framework(installer, "ubuntu-sdk-13.10")
            self.assertRaisesRegex(
                ValueError, "Package has no manifest",
                installer.audit_control, package.control)

    def test_audit_control_invalid_manifest_json(self):
        path = self.make_fake_package(
            control_fields={"Click-Version": "0.1"},
            control_scripts={"manifest": "{", "preinst": static_preinst})
        with closing(DebFile(filename=path)) as package:
            installer = ClickInstaller(self.temp_dir)
            self.make_framework(installer, "ubuntu-sdk-13.10")
            self.assertRaises(
                ValueError, installer.audit_control, package.control)

    def test_audit_control_no_name(self):
        path = self.make_fake_package(
            control_fields={"Click-Version": "0.1"},
            manifest={})
        with closing(DebFile(filename=path)) as package:
            self.assertRaisesRegex(
                ValueError, 'No "name" entry in manifest',
                ClickInstaller(self.temp_dir).audit_control, package.control)

    def test_audit_control_name_bad_character(self):
        path = self.make_fake_package(
            control_fields={"Click-Version": "0.1"},
            manifest={"name": "../evil"})
        with closing(DebFile(filename=path)) as package:
            self.assertRaisesRegex(
                ValueError,
                'Invalid character "/" in "name" entry: ../evil',
                ClickInstaller(self.temp_dir).audit_control, package.control)

    def test_audit_control_no_version(self):
        path = self.make_fake_package(
            control_fields={"Click-Version": "0.1"},
            manifest={"name": "test-package"})
        with closing(DebFile(filename=path)) as package:
            self.assertRaisesRegex(
                ValueError, 'No "version" entry in manifest',
                ClickInstaller(self.temp_dir).audit_control, package.control)

    def test_audit_control_no_framework(self):
        path = self.make_fake_package(
            control_fields={"Click-Version": "0.1"},
            manifest={"name": "test-package", "version": "1.0"},
            control_scripts={"preinst": static_preinst})
        with closing(DebFile(filename=path)) as package:
            self.assertRaisesRegex(
                ValueError, 'No "framework" entry in manifest',
                ClickInstaller(self.temp_dir).audit_control, package.control)

    def test_audit_control_missing_framework(self):
        path = self.make_fake_package(
            control_fields={"Click-Version": "0.1"},
            manifest={
                "name": "test-package",
                "version": "1.0",
                "framework": "missing",
            },
            control_scripts={"preinst": static_preinst})
        with closing(DebFile(filename=path)) as package:
            installer = ClickInstaller(self.temp_dir)
            self.make_framework(installer, "present")
            self.assertRaisesRegex(
                ValueError, 'Framework "missing" not present on system',
                installer.audit_control, package.control)

    def test_audit_control_missing_framework_force(self):
        path = self.make_fake_package(
            control_fields={"Click-Version": "0.1"},
            manifest={
                "name": "test-package",
                "version": "1.0",
                "framework": "missing",
            })
        with closing(DebFile(filename=path)) as package:
            installer = ClickInstaller(self.temp_dir, True)
            self.make_framework(installer, "present")
            installer.audit_control(package.control)

    def test_audit_passes_correct_package(self):
        path = self.make_fake_package(
            control_fields={"Click-Version": "0.1"},
            manifest={
                "name": "test-package",
                "version": "1.0",
                "framework": "ubuntu-sdk-13.10",
            },
            control_scripts={"preinst": static_preinst})
        installer = ClickInstaller(self.temp_dir)
        self.make_framework(installer, "ubuntu-sdk-13.10")
        self.assertEqual(("test-package", "1.0"), installer.audit(path))

    def test_no_write_permission(self):
        path = self.make_fake_package(
            control_fields={"Click-Version": "0.1"},
            manifest={
                "name": "test-package",
                "version": "1.0",
                "framework": "ubuntu-sdk-13.10",
            },
            control_scripts={"preinst": static_preinst})
        write_mask = ~(stat.S_IWUSR | stat.S_IWGRP | stat.S_IWOTH)
        installer = ClickInstaller(self.temp_dir)
        self.make_framework(installer, "ubuntu-sdk-13.10")
        temp_dir_mode = os.stat(self.temp_dir).st_mode
        try:
            os.chmod(self.temp_dir, temp_dir_mode & write_mask)
            self.assertRaises(
                ClickInstallerPermissionDenied, installer.install, path)
        finally:
            os.chmod(self.temp_dir, temp_dir_mode)

    @skipUnless(
        os.path.exists(ClickInstaller(None)._preload_path()),
        "preload bits not built; installing packages will fail")
    @mock.patch("click.install.run_hooks")
    def test_install(self, mock_run_hooks):
        path = self.make_fake_package(
            control_fields={
                "Package": "test-package",
                "Version": "1.0",
                "Architecture": "all",
                "Maintainer": "Foo Bar <foo@example.org>",
                "Description": "test",
                "Click-Version": "0.1",
            },
            manifest={
                "name": "test-package",
                "version": "1.0",
                "framework": "ubuntu-sdk-13.10",
            },
            control_scripts={"preinst": static_preinst},
            data_files=["foo"])
        root = os.path.join(self.temp_dir, "root")
        installer = ClickInstaller(root)
        self.make_framework(installer, "ubuntu-sdk-13.10")
        with mock_quiet_subprocess_call():
            installer.install(path)
        self.assertCountEqual([".click.log", "test-package"], os.listdir(root))
        package_dir = os.path.join(root, "test-package")
        self.assertCountEqual(["1.0", "current"], os.listdir(package_dir))
        inst_dir = os.path.join(package_dir, "current")
        self.assertTrue(os.path.islink(inst_dir))
        self.assertEqual("1.0", os.readlink(inst_dir))
        self.assertCountEqual([".click", "foo"], os.listdir(inst_dir))
        status_path = os.path.join(inst_dir, ".click", "status")
        with open(status_path) as status_file:
            status = list(Deb822.iter_paragraphs(status_file))
        self.assertEqual(1, len(status))
        self.assertEqual({
            "Package": "test-package",
            "Status": "install ok installed",
            "Version": "1.0",
            "Architecture": "all",
            "Maintainer": "Foo Bar <foo@example.org>",
            "Description": "test",
            "Click-Version": "0.1",
        }, status[0])
        mock_run_hooks.assert_called_once_with(
            root, "test-package", None, "1.0")

    @skipUnless(
        os.path.exists(ClickInstaller(None)._preload_path()),
        "preload bits not built; installing packages will fail")
    def test_sandbox(self):
        original_call = subprocess.call

        def call_side_effect(*args, **kwargs):
            if "TEST_VERBOSE" in os.environ:
                return original_call(
                    ["touch", os.path.join(self.temp_dir, "sentinel")],
                    **kwargs)
            else:
                with open("/dev/null", "w") as devnull:
                    return original_call(
                        ["touch", os.path.join(self.temp_dir, "sentinel")],
                        stdout=devnull, stderr=devnull, **kwargs)

        path = self.make_fake_package(
            control_fields={
                "Package": "test-package",
                "Version": "1.0",
                "Architecture": "all",
                "Maintainer": "Foo Bar <foo@example.org>",
                "Description": "test",
                "Click-Version": "0.1",
            },
            manifest={
                "name": "test-package",
                "version": "1.0",
                "framework": "ubuntu-sdk-13.10",
            },
            control_scripts={"preinst": static_preinst},
            data_files=["foo"])
        root = os.path.join(self.temp_dir, "root")
        installer = ClickInstaller(root)
        self.make_framework(installer, "ubuntu-sdk-13.10")
        with mock.patch("subprocess.call") as mock_call:
            mock_call.side_effect = call_side_effect
            self.assertRaises(
                subprocess.CalledProcessError, installer.install, path)
        self.assertFalse(
            os.path.exists(os.path.join(self.temp_dir, "sentinel")))

    @skipUnless(
        os.path.exists(ClickInstaller(None)._preload_path()),
        "preload bits not built; installing packages will fail")
    @mock.patch("click.install.run_hooks")
    def test_upgrade(self, mock_run_hooks):
        path = self.make_fake_package(
            control_fields={
                "Package": "test-package",
                "Version": "1.1",
                "Architecture": "all",
                "Maintainer": "Foo Bar <foo@example.org>",
                "Description": "test",
                "Click-Version": "0.1",
            },
            manifest={
                "name": "test-package",
                "version": "1.1",
                "framework": "ubuntu-sdk-13.10",
            },
            control_scripts={"preinst": static_preinst},
            data_files=["foo"])
        root = os.path.join(self.temp_dir, "root")
        package_dir = os.path.join(root, "test-package")
        inst_dir = os.path.join(package_dir, "current")
        os.makedirs(os.path.join(package_dir, "1.0"))
        os.symlink("1.0", inst_dir)
        installer = ClickInstaller(root)
        self.make_framework(installer, "ubuntu-sdk-13.10")
        with mock_quiet_subprocess_call():
            installer.install(path)
        self.assertCountEqual([".click.log", "test-package"], os.listdir(root))
        self.assertCountEqual(
            ["1.0", "1.1", "current"], os.listdir(package_dir))
        self.assertTrue(os.path.islink(inst_dir))
        self.assertEqual("1.1", os.readlink(inst_dir))
        self.assertCountEqual([".click", "foo"], os.listdir(inst_dir))
        status_path = os.path.join(inst_dir, ".click", "status")
        with open(status_path) as status_file:
            status = list(Deb822.iter_paragraphs(status_file))
        self.assertEqual(1, len(status))
        self.assertEqual({
            "Package": "test-package",
            "Status": "install ok installed",
            "Version": "1.1",
            "Architecture": "all",
            "Maintainer": "Foo Bar <foo@example.org>",
            "Description": "test",
            "Click-Version": "0.1",
        }, status[0])
        mock_run_hooks.assert_called_once_with(
            root, "test-package", "1.0", "1.1")
