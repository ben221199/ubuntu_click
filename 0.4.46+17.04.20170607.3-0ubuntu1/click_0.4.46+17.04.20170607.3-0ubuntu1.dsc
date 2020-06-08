-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Format: 3.0 (quilt)
Source: click
Binary: click, click-dev, python3-click-package, libclick-0.4-0, libclick-0.4-dev, gir1.2-click-0.4, click-doc, packagekit-plugin-click
Architecture: any all
Version: 0.4.46+17.04.20170607.3-0ubuntu1
Maintainer: Colin Watson <cjwatson@ubuntu.com>
Standards-Version: 3.9.5
Vcs-Browser: http://bazaar.launchpad.net/~click-hackers/click/devel/files
Vcs-Bzr: https://code.launchpad.net/~click-hackers/click/devel
Testsuite: autopkgtest
Testsuite-Triggers: bzr, debootstrap, debsig-verify, debsigs, iputils-ping, python3-six, schroot, sudo
Build-Depends: debhelper (>= 9~), dh-autoreconf, intltool, python3:any (>= 3.2), python3-all:any, python3-setuptools, python3-apt, python3-debian, python3-gi, python3:any (>= 3.3) | python3-mock, pep8, python3-pep8, pyflakes, python3-sphinx, pkg-config, valac, gobject-introspection (>= 0.6.7), libgirepository1.0-dev (>= 0.6.7), libglib2.0-dev (>= 2.34), gir1.2-glib-2.0, libjson-glib-dev (>= 0.10), libgee-0.8-dev, libpackagekit-glib2-dev (>= 0.8.10), python3-coverage, python3-six, dh-systemd (>= 1.3)
Package-List:
 click deb admin optional arch=any
 click-dev deb admin optional arch=any
 click-doc deb doc optional arch=all
 gir1.2-click-0.4 deb introspection optional arch=any
 libclick-0.4-0 deb libs optional arch=any
 libclick-0.4-dev deb libdevel optional arch=any
 packagekit-plugin-click deb admin optional arch=any
 python3-click-package deb python optional arch=any
Checksums-Sha1:
 e0485cbbb771138750488f7486e0b3f4ac18fc60 140365 click_0.4.46+17.04.20170607.3.orig.tar.gz
 bfad805f378f05116cc405ca35da5bd4f2885825 19852 click_0.4.46+17.04.20170607.3-0ubuntu1.debian.tar.xz
Checksums-Sha256:
 b1c9c421def3cc94d9274d157f063435ca7aeb6660242574797edea9250513fe 140365 click_0.4.46+17.04.20170607.3.orig.tar.gz
 21677d5c371c83ec466b1755e4e2a92dcd4d7ef72bd67c6cbebee95195992f57 19852 click_0.4.46+17.04.20170607.3-0ubuntu1.debian.tar.xz
Files:
 bc6ec7e16074048ed1b5de26004d1cdd 140365 click_0.4.46+17.04.20170607.3.orig.tar.gz
 e64425d2f9ed598d8f71bd2ea4404287 19852 click_0.4.46+17.04.20170607.3-0ubuntu1.debian.tar.xz

-----BEGIN PGP SIGNATURE-----

iEYEARECAAYFAlk65B0ACgkQDTAwc5ER+zXKtgCeLlClG+MfzWvPxUgbt4U5xBld
YOUAoJkNVCwpGSkrmvFU9th2ONBLxyhv
=utH5
-----END PGP SIGNATURE-----
