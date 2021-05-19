-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA256

Format: 3.0 (quilt)
Source: click
Binary: click, click-dev, python3-click-package, libclick-0.4-0, libclick-dev, gir1.2-click-0.4, click-doc
Architecture: any all
Version: 0.5.0-1
Maintainer: Debian UBports Team <team+ubports@tracker.debian.org>
Uploaders:  Mike Gabriel <sunweaver@debian.org>,
Homepage: https://gitlab.com/ubports/core/click/
Standards-Version: 4.5.1
Vcs-Browser: https://salsa.debian.org/ubports-team/click/
Vcs-Git: https://salsa.debian.org/ubports-team/click.git
Testsuite: autopkgtest
Testsuite-Triggers: @builddeps@, debootstrap, debsig-verify, debsigs, iputils-ping, libclick-0.4-dev, python3-six, schroot, sudo
Build-Depends: debhelper-compat (= 13), dh-python, gir1.2-glib-2.0, gobject-introspection (>= 0.6.7), libgee-0.8-dev, libgirepository1.0-dev (>= 0.6.7), libglib2.0-dev (>= 2.34), libjson-glib-dev (>= 0.10), pkg-config, pyflakes3, python3-all:any, python3-apt, python3-coverage, python3-debian, python3-gi, python3-pep8, python3-setuptools, python3-six, python3-sphinx, python3:any (>= 3.2), python3:any (>= 3.3) | python3-mock, valac
Package-List:
 click deb admin optional arch=any
 click-dev deb admin optional arch=any
 click-doc deb doc optional arch=all
 gir1.2-click-0.4 deb introspection optional arch=any
 libclick-0.4-0 deb libs optional arch=any
 libclick-dev deb libdevel optional arch=any
 python3-click-package deb python optional arch=any
Checksums-Sha1:
 efbd8e7d6f1688542413529757c5cd28002fc80c 167342 click_0.5.0.orig.tar.gz
 9f29bbfb1499957edf89e37245a51746905ac34e 21860 click_0.5.0-1.debian.tar.xz
Checksums-Sha256:
 025ba98148e5d51a9d24c649040c4f5afa6c00ca3fdc1f390293802340cd2bc7 167342 click_0.5.0.orig.tar.gz
 78f8280f296a98f81af265b32a63b866a996e724b242ee94778710f4d010aef4 21860 click_0.5.0-1.debian.tar.xz
Files:
 6ad9848ad78e76c8cf2f65c0c8ad2779 167342 click_0.5.0.orig.tar.gz
 795535b97d544f50225d432cf60ca72c 21860 click_0.5.0-1.debian.tar.xz

-----BEGIN PGP SIGNATURE-----

iQJJBAEBCAAzFiEEm/uu6GwKpf+/IgeCmvRrMCV3GzEFAmBstpoVHHN1bndlYXZl
ckBkZWJpYW4ub3JnAAoJEJr0azAldxsxecAP/3umRZ9kYwlIDxyH4AGlAahQKijS
6DDF+W3xwn/XDU5R3dFfst8vaDLkg3GapBNJdbwkHPbKzWvbbxsFT90E26Sbhwmv
u3M38aa2iAKs8jtRouEVG6w+k+jzxL2QKmZYGO+FLGTgS5w9jsiJM/bxUjdeF1sT
nVl9KSIbS0cG662ds0BVN5OwOhvvhx3P/xneLlBeghsQQJRCHxpidqa4guYZyY8E
meUMdsG/2v+6oawgLZT4is6GVlE5LIeVtIbNzZKG+yrezsXbU3jsdSWxT3JpBC4J
0PBAaYeZn2L8tXU5oU+R6em7TB+mk88HDk/CSIsK2j5Xk/DSH6G461UfAKPPSQ3v
VjBUx4eXcjWtGxU75PbFH/X53grDYPT2HO0JlUD/IpSrcpf47tp/1iNgq1mVlcw/
X23KJPkESeO5C36w5X2h0TNREqMlUQT5pYKW6kaaxvW6/vms9n9m6m0HE/swaNxG
IuSIYh8uaCL3NP2U49zC0E8xihdelHuk6QfMDV/AFd6j61GC4RWmC2qLc2/ht2tq
yOsOePtrPi0i4RUFh2M2bQ9EqEGGt4UGIY2ORbSqx03SNLvVqrhOfrD+1V2GY9R+
HDqRz9m+TeQoTp7+/As8aiTAN1L14B3i6b9hBhqFgT/6X3dWwO5YNZ+p0EIK1MSr
3YMAwK7T5kQFYtIn
=awks
-----END PGP SIGNATURE-----
