-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA256

Format: 3.0 (quilt)
Source: click
Binary: click, click-dev, python3-click-package, libclick-0.4-0, libclick-dev, gir1.2-click-0.4, click-doc
Architecture: any all
Version: 0.5.0-3
Maintainer: Debian UBports Team <team+ubports@tracker.debian.org>
Uploaders:  Mike Gabriel <sunweaver@debian.org>,
Homepage: https://gitlab.com/ubports/core/click/
Standards-Version: 4.6.0
Vcs-Browser: https://salsa.debian.org/ubports-team/click/
Vcs-Git: https://salsa.debian.org/ubports-team/click.git
Testsuite: autopkgtest
Testsuite-Triggers: @builddeps@, debootstrap, debsig-verify, debsigs, iputils-ping, python3-six, schroot, sudo
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
 013b3c389413fe49178520b9ec7689e6cd816d80 22048 click_0.5.0-3.debian.tar.xz
Checksums-Sha256:
 025ba98148e5d51a9d24c649040c4f5afa6c00ca3fdc1f390293802340cd2bc7 167342 click_0.5.0.orig.tar.gz
 dd4cf0921fd0aea1ff343adf9fe028c6724e07507bcf6350a8f7ffa28db52a22 22048 click_0.5.0-3.debian.tar.xz
Files:
 6ad9848ad78e76c8cf2f65c0c8ad2779 167342 click_0.5.0.orig.tar.gz
 edf9a839d545225b9770ecd31b731af1 22048 click_0.5.0-3.debian.tar.xz

-----BEGIN PGP SIGNATURE-----

iQJJBAEBCAAzFiEEm/uu6GwKpf+/IgeCmvRrMCV3GzEFAmGw22EVHHN1bndlYXZl
ckBkZWJpYW4ub3JnAAoJEJr0azAldxsxWhkP/0rdsfUmZoUFPP7AFm1TYAVfOAM9
iePkoByy8TEgMsCkPAK4HjK00mwqxPshXQFpmN9XbgUJ3JNoaXD9ViIZZOrxcjxv
9V9G8GneCjgSbCqNRKpV6dbhQmydYPmB7fd1+z3Kp5kXUO8/KtWiw306iUVmLRwb
Th0EpNt55Ve9JVyr3uRro2G9PbDWTbJpAUy+govmX9iMLNZfYnyvvxuvzMBt57Jh
cD8Sl2q+occvZCQr9VLnYnCqwq+ShlhrAC/zZV9/mq9pi46KDH3fcglQ7hLxqXKZ
BN9ogVPMBouecXG34fsk7hff0PuJ0Y0xjO5LZFKDkNUd5sTPhdTlb/bduplsp7Qe
dUiQWsXikdra6vJVc9GgR87nAa54zsPbngBfNaNNvMyHQ2LlCEbyX9yDYS4Z5qJv
FI5aTaqsfoLK6mla0VFEBlebUyYJdMGjej0W7Tzzz/1XoHaMJvJYVMDaTL0tVFpI
ofj69KcqBQIvoAvswOXgoImBadPSWYX1bKvfmrTUVJyyT73QN1T87ai5SHRg14uh
7quZ55ZeK66fk/T9X6ZFvX1TD91YaETTv3zcsm2wFYN6CPvHmd/SNdF9TcjHyhNK
85zLrlWT0jDEcxqFSfltUiF93sRTozBxHcm0KKK0+1YmaGE1GcPx6157vIMF8UYv
4duy1VvlmL70aMXi
=/nyN
-----END PGP SIGNATURE-----
