-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Format: 3.0 (quilt)
Source: click
Binary: click, click-dev, python3-click-package, libclick-0.4-0, libclick-0.4-dev, gir1.2-click-0.4, click-doc, packagekit-plugin-click
Architecture: any all
Version: 0.4.46+16.10.20170607.3-0ubuntu1
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
 88f3ac89a038d4d9065c1dec0c4f892edbdace14 140369 click_0.4.46+16.10.20170607.3.orig.tar.gz
 27a0974de86ccff44bea372d98a051f469c1c925 19832 click_0.4.46+16.10.20170607.3-0ubuntu1.debian.tar.xz
Checksums-Sha256:
 37e0382ab854535f5faafa4624decffd3ae30d7cdd3023632b0d5342a8c5ed41 140369 click_0.4.46+16.10.20170607.3.orig.tar.gz
 e44be10d841c7e38ea8c35865763d1cdca9799a4b0b3086c3d6e2ed374cfd35d 19832 click_0.4.46+16.10.20170607.3-0ubuntu1.debian.tar.xz
Files:
 867327d2f218793fe494059e8383c6a8 140369 click_0.4.46+16.10.20170607.3.orig.tar.gz
 3fd065e4456a630fd4cff64bd9393963 19832 click_0.4.46+16.10.20170607.3-0ubuntu1.debian.tar.xz

-----BEGIN PGP SIGNATURE-----

iEYEARECAAYFAlk66HQACgkQDTAwc5ER+zVnlQCfdDOC3Y/FVAUROZyuXNtb7Czf
qC4AoJxPled6O0fl3QSvke6lje510FTC
=nT33
-----END PGP SIGNATURE-----
