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

"""Show manifest information for a Click package."""

from __future__ import print_function

from contextlib import closing
import json
from optparse import OptionParser
import sys

from gi.repository import Click

from click.install import DebFile
from click.json_helpers import json_object_to_python


def get_manifest(options, arg):
    if "/" not in arg:
        db = Click.DB()
        db.read()
        if options.root is not None:
            db.add(options.root)
        registry = Click.User.for_user(db, name=options.user)
        if registry.has_package_name(arg):
            return json_object_to_python(registry.get_manifest(arg))

    with closing(DebFile(filename=arg)) as package:
        with package.control.get_file(
                "manifest", encoding="UTF-8") as manifest_file:
            return json.load(manifest_file)


def run(argv):
    parser = OptionParser("%prog info [options] PATH")
    parser.add_option(
        "--root", metavar="PATH", help="look for additional packages in PATH")
    parser.add_option(
        "--user", metavar="USER",
        help="look up PACKAGE-NAME for USER (if you have permission; "
             "default: current user)")
    options, args = parser.parse_args(argv)
    if len(args) < 1:
        parser.error("need file name")
    try:
        manifest = get_manifest(options, args[0])
    except Exception as e:
        print(e, file=sys.stderr)
        return 1
    keys = list(manifest)
    for key in keys:
        if key.startswith("_"):
            del manifest[key]
    json.dump(
        manifest, sys.stdout, ensure_ascii=False, sort_keys=True, indent=4,
        separators=(",", ": "))
    print()
    return 0
