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

"""List installed Click packages."""

from __future__ import print_function

import io
import json
from optparse import OptionParser
import os

from click.database import ClickDB
from click.user import ClickUser


def list_packages(options):
    db = ClickDB(options.root)
    if options.all:
        for package, version, path in db.packages(all_versions=True):
            yield package, version, path
    else:
        registry = ClickUser(db, user=options.user)
        for package, version in sorted(registry.items()):
            yield package, version, registry.path(package)


def run(argv):
    parser = OptionParser("%prog list [options]")
    parser.add_option(
        "--root", metavar="PATH", help="look for additional packages in PATH")
    parser.add_option(
        "--all", default=False, action="store_true",
        help="list all installed packages")
    parser.add_option(
        "--user", metavar="USER",
        help="list packages registered by USER (if you have permission)")
    parser.add_option(
        "--manifest", default=False, action="store_true",
        help="print JSON array of manifests of all installed packages")
    options, _ = parser.parse_args(argv)
    json_output = []
    for package, version, path in list_packages(options):
        if options.manifest:
            try:
                manifest_path = os.path.join(
                    path, ".click", "info", "%s.manifest" % package)
                with io.open(manifest_path, encoding="UTF-8") as manifest:
                    json_output.append(json.load(manifest))
            except Exception:
                pass
        else:
            print("%s\t%s" % (package, version))
    if options.manifest:
        print(json.dumps(
            json_output, ensure_ascii=False, sort_keys=True, indent=4,
            separators=(",", ": ")))
