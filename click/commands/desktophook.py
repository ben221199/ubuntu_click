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

"""Click desktop hook.  (Temporary; do not rely on this.)"""

from __future__ import print_function

import errno
import io
import json
from optparse import OptionParser
import os

from click import osextras
from click.query import find_package_directory


COMMENT = \
    '# Generated by "click desktophook"; changes here will be overwritten.'


def desktop_entries(directory, only_ours=False):
    for entry in osextras.listdir_force(directory):
        if not entry.endswith(".desktop"):
            continue
        path = os.path.join(directory, entry)
        if only_ours:
            try:
                with io.open(path, encoding="UTF-8") as f:
                    if COMMENT not in f.read():
                        continue
            except Exception:
                continue
        yield entry


def split_entry(entry):
    entry = entry[:-8]  # strip .desktop
    return entry.split("_", 2)


def older(source_path, target_path):
    """Return True iff source_path is older than target_path.

    It's also OK for target_path to be missing.
    """
    try:
        source_mtime = os.stat(source_path)
    except OSError as e:
        if e.errno == errno.ENOENT:
            return False
    try:
        target_mtime = os.stat(target_path)
    except OSError as e:
        if e.errno == errno.ENOENT:
            return True
    return source_mtime < target_mtime


def read_hooks_for(path, package, app_name):
    try:
        directory = find_package_directory(path)
        manifest_path = os.path.join(
            directory, ".click", "info", "%s.manifest" % package)
        with io.open(manifest_path, encoding="UTF-8") as manifest:
            return json.load(manifest).get("hooks", {}).get(app_name, {})
    except Exception:
        return {}


def quote_for_desktop_exec(s):
    """Quote a string for Exec in a .desktop file.

    The rules are fairly awful.  See:
      http://standards.freedesktop.org/desktop-entry-spec/latest/ar01s06.html
    """
    for c in s:
        if c in " \t\n\"'\\><~|&;$*?#()`%":
            break
    else:
        return s
    quoted = []
    for c in s:
        if c in "\"`$\\":
            quoted.append("\\" + c)
        elif c == "%":
            quoted.append("%%")
        else:
            quoted.append(c)
    escaped = []
    for c in "".join(quoted):
        if c == "\\":
            escaped.append("\\\\")
        else:
            escaped.append(c)
    return '"%s"' % "".join(escaped)


# TODO: This is a very crude .desktop file mangler; we should instead
# implement proper (de)serialisation.
def write_desktop_file(target_path, source_path, profile):
    osextras.ensuredir(os.path.dirname(target_path))
    with io.open(source_path, encoding="UTF-8") as source, \
         io.open(target_path, "w", encoding="UTF-8") as target:
        source_dir = find_package_directory(source_path)
        written_comment = False
        seen_path = False
        for line in source:
            if not line.rstrip("\n") or line.startswith("#"):
                # Comment
                target.write(line)
            elif line.startswith("["):
                # Group header
                target.write(line)
                if not written_comment:
                    print(COMMENT, file=target)
            elif "=" not in line:
                # Who knows?
                target.write(line)
            else:
                key, value = line.split("=", 1)
                key = key.strip()
                value = value.strip()
                if key == "Exec":
                    target.write(
                        "%s=aa-exec -p %s -- %s\n" %
                        (key, quote_for_desktop_exec(profile), value))
                elif key == "Path":
                    target.write("%s=%s\n" % (key, source_dir))
                    seen_path = True
                elif key == "Icon":
                    icon_path = os.path.join(source_dir, value)
                    if os.path.exists(icon_path):
                        target.write("%s=%s\n" % (key, icon_path))
                    else:
                        target.write("%s=%s\n" % (key, value))
                else:
                    target.write("%s=%s\n" % (key, value))
        if not seen_path:
            target.write("Path=%s\n" % source_dir)


def run(argv):
    parser = OptionParser("%prog desktophook [options]")
    parser.parse_args(argv)
    source_dir = os.path.expanduser("~/.local/share/click/hooks/desktop")
    target_dir = os.path.expanduser("~/.local/share/applications")
    source_entries = set(desktop_entries(source_dir))
    target_entries = set(desktop_entries(target_dir, only_ours=True))

    for new_entry in source_entries:
        package, app_name, version = split_entry(new_entry)
        source_path = os.path.join(source_dir, new_entry)
        target_path = os.path.join(target_dir, new_entry)
        if older(source_path, target_path):
            hooks = read_hooks_for(source_path, package, app_name)
            if "apparmor" in hooks:
                profile = "%s_%s_%s" % (package, app_name, version)
            else:
                profile = "unconfined"
            write_desktop_file(target_path, source_path, profile)

    for remove_entry in target_entries - source_entries:
        os.unlink(os.path.join(target_dir, remove_entry))
