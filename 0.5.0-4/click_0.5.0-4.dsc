-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA256

Format: 3.0 (quilt)
Source: click
Binary: click, click-dev, python3-click-package, libclick-0.4-0, libclick-dev, gir1.2-click-0.4, click-doc
Architecture: any all
Version: 0.5.0-4
Maintainer: Debian UBports Team <team+ubports@tracker.debian.org>
Uploaders:  Mike Gabriel <sunweaver@debian.org>,
Homepage: https://gitlab.com/ubports/core/click/
Standards-Version: 4.6.0
Vcs-Browser: https://salsa.debian.org/ubports-team/click/
Vcs-Git: https://salsa.debian.org/ubports-team/click.git
Testsuite: autopkgtest
Testsuite-Triggers: @builddeps@, debootstrap, debsig-verify, debsigs, iputils-ping, kmod, python3-six, schroot, sudo
Build-Depends: debhelper-compat (= 13), dh-python, gir1.2-glib-2.0, gobject-introspection (>= 0.6.7), libgee-0.8-dev, libgirepository1.0-dev (>= 0.6.7), libglib2.0-dev (>= 2.34), libjson-glib-dev (>= 0.10), pkg-config, pyflakes3, python3-all:any, python3-apt, python3-coverage, python3-debian, python3-gi, python3-pip, python3-pep8, python3-setuptools, python3-six, python3-sphinx, python3:any (>= 3.2), python3:any (>= 3.3) | python3-mock, valac
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
 36ac93d012132ad831b2a84b2ecb80d8f1601b26 22108 click_0.5.0-4.debian.tar.xz
Checksums-Sha256:
 025ba98148e5d51a9d24c649040c4f5afa6c00ca3fdc1f390293802340cd2bc7 167342 click_0.5.0.orig.tar.gz
 6e89cb4e34dc995cd9b28d20e1e251f783573830f507027a10bc4c044c6ee8d9 22108 click_0.5.0-4.debian.tar.xz
Files:
 6ad9848ad78e76c8cf2f65c0c8ad2779 167342 click_0.5.0.orig.tar.gz
 6bdd85750279ab25bb6f7f57db369b75 22108 click_0.5.0-4.debian.tar.xz

-----BEGIN PGP SIGNATURE-----

iQJJBAEBCAAzFiEEm/uu6GwKpf+/IgeCmvRrMCV3GzEFAmG46/4VHHN1bndlYXZl
ckBkZWJpYW4ub3JnAAoJEJr0azAldxsxnRYQAI86rECgW+n11nreteaP3vYsES5r
gnSg0ChYX/eN4NaW0rINI2HjnMiGuWB2QppUiKhXBxkI/MIUXwFYw771ukiULdno
LMqD3i1NYvzcGaZ8nT5QC+tQMwh9RtO4neIafm1XneL+8S1B28SDOnY7zwgWVMYh
hmrFXGZ2hwQ06TlwB8PX6a6XTd4RNk5L542MxZKdFBmkv2RsfvysQJ55s8tSK/Sd
IY5Truqjr1oV6Oa9sq4I8t1yEtyBlFZj0qHmUshhTdpRSLyCjgKh1th+IMEynQRC
RqfmMebU+LAvryboIseYOT1IajzAChfE4pUjA9r5tVMU0/+sAZvrxZ95n6AEQVx+
Bh9YW4gccNBWJYPvKQQIuxqpIOledvmLI+Zcpd7/+d5X5P6bGbu5rDGb/4syrbet
R59kPSPzPmMnOYsPFVaMxN3PH9A5RVSIbQNA9OGgwOMAhgVEC4HoomeAp31W6G0r
zkQXRrYAKPRGj+ZQjy1JecZ2P/vgPImNDch0/FQ+4MetlrjQlLyUHn/4SECUSGU4
OkzfT/3RBE6dkqTYKZ3vvgKJlmbQxVi+R/1qAS7WYSYTTvdV7fjwgbVUGouMcqxI
XnWMwmdU3wS+QVkU+AaKioKEopz4mvuybGOOLbDu6Y2/v03Ce6MFBsy6i8AWiuDt
rkGvlXjF+wh9Wl5z
=xMBV
-----END PGP SIGNATURE-----
