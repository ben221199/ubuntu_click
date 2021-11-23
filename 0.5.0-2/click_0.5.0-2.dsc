-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA256

Format: 3.0 (quilt)
Source: click
Binary: click, click-dev, python3-click-package, libclick-0.4-0, libclick-dev, gir1.2-click-0.4, click-doc
Architecture: any all
Version: 0.5.0-2
Maintainer: Debian UBports Team <team+ubports@tracker.debian.org>
Uploaders:  Mike Gabriel <sunweaver@debian.org>,
Homepage: https://gitlab.com/ubports/core/click/
Standards-Version: 4.6.0
Vcs-Browser: https://salsa.debian.org/ubports-team/click/
Vcs-Git: https://salsa.debian.org/ubports-team/click.git
Testsuite: autopkgtest
Testsuite-Triggers: @builddeps@, debootstrap, debsig-verify, debsigs, iputils-ping, libclick-0.4-dev, python3-six, schroot, sudo
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
 41f8f0219d268259498d11d44b181f86e78aa74b 22000 click_0.5.0-2.debian.tar.xz
Checksums-Sha256:
 025ba98148e5d51a9d24c649040c4f5afa6c00ca3fdc1f390293802340cd2bc7 167342 click_0.5.0.orig.tar.gz
 98e85684969b155307de51360f65b2c3befd88824d61ce6d8ac367c32a73651d 22000 click_0.5.0-2.debian.tar.xz
Files:
 6ad9848ad78e76c8cf2f65c0c8ad2779 167342 click_0.5.0.orig.tar.gz
 cd03b0ffadbdf853997c4b3eb7e11b45 22000 click_0.5.0-2.debian.tar.xz

-----BEGIN PGP SIGNATURE-----

iQJJBAEBCAAzFiEEm/uu6GwKpf+/IgeCmvRrMCV3GzEFAmGcBY8VHHN1bndlYXZl
ckBkZWJpYW4ub3JnAAoJEJr0azAldxsxT08P/REJTrJ4DpDZA404eaMu2lOHYCtC
4euwBn7P+1llPYp6ocpxC2FttT0jdpTVb+I6wf97cK315Kc52UvB0lpcVM4d/ajJ
LY7KHIFEILaieMt3wch4fbql60Qagz68i0Oo2XF0Nhdl+FRGw8JtBAFVVhs93ZoW
61reDZW8yxv94vqIXMqRWNsa/cfJsoOpVIglyQr65HVdvnf/Dq5uPAgK319uw7V8
he4t3BlfDl6dD4FWcZpYV4gWwWwEffABonmaX/uhES9PcICC2WvYQP9NWQDTbBTh
VjgqcgmoLdA7vWHdKwc4nx0l1KL+NMyHFxR3u0MwcdqcFi3MjkNiTq0UsWsGiD3W
sgdlOzR85esz1SyEoz+RcvoTy4YeQUia6D6t70y+2WM0anrn1Kgt4AbkgcGi8RHo
abSSYjF0cDLBPR3EMJkAG/EBg04x97eN4EOsR5k7GD8BIEnHux6hf0nexNjwSLWK
WZBHc3u4iL+ey5Jd7mbwoEOal6B7FnNCF0qLg52c07He+US4SB2KLqNlTL4iNUz+
Jm0S1liNn+/1hpAP9igr92Mq9/cLeF3s7oGs2M7RSswmfuVd0tOJgJrtl0qo/do2
e4UKD4H9UIDe2ArK9S0zAF1Ql9V9/dacGbOqTBpzbpwrdduUaP9inGyrK4TqgpLq
xwKdnbJ/0xtMog8R
=7WPA
-----END PGP SIGNATURE-----
