-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA256

Format: 3.0 (quilt)
Source: click
Binary: click, click-dev, python3-click-package, libclick-0.4-0, libclick-dev, gir1.2-click-0.4, click-doc
Architecture: any all
Version: 0.5.0-5
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
 4b171ac88fc1437a2bbcb1491cd55fc7c5320bf5 22272 click_0.5.0-5.debian.tar.xz
Checksums-Sha256:
 025ba98148e5d51a9d24c649040c4f5afa6c00ca3fdc1f390293802340cd2bc7 167342 click_0.5.0.orig.tar.gz
 ee501b3468c2b7836e7d886558e4ebc075850ab844a64fe97f2d2d85df6ba3b9 22272 click_0.5.0-5.debian.tar.xz
Files:
 6ad9848ad78e76c8cf2f65c0c8ad2779 167342 click_0.5.0.orig.tar.gz
 a8a2c8558d9434410a1d3330422d5696 22272 click_0.5.0-5.debian.tar.xz

-----BEGIN PGP SIGNATURE-----

iQJJBAEBCAAzFiEEm/uu6GwKpf+/IgeCmvRrMCV3GzEFAmH6fO8VHHN1bndlYXZl
ckBkZWJpYW4ub3JnAAoJEJr0azAldxsxrEEP/2aXQ3SvNQqL+p2T/X+I1C7it0j5
StvJaTUzR5BXrh1gs6Xfc7oI3eOYWvu0k+l/56A7B9kQO6hmz5WD8WFVPDvl0vcl
d1DkNQ7RcZGLUkNsRPe8UO5EkBCZZk6UjMiGzQx+1TIGBfqsEppKLe2vQko5wo86
V+h8yXWafgVNFMiqkr/MKpk/N64R1Eo46Jp9wSsr8dU0N+dqqqBjy1EkWTN97I1c
/0YCz19A5BQUniEh+unyPO9gAukc1aiYXfFirl5IxelhRwUIctto2rBphN3xn2EZ
H1hGdDLUAeYuBh8jUX12DlUBjPdxbWyf+Xe0kyoNmcvjljf3F4AftWpLuEJ0XIkz
7BHd6PTae1q4pdBvNYIIOsux6Fh4Sb2O32xLgQqS6WFuG2Lfp7l5Z+U3tIF8sY9S
n2nDl1ZwJD3gAUctsjHcyjurIBazanbC4pPFfRg+TBcyVKE/A5qcvoKoaFYMHmOg
72EyaSkQUrEKG7nL7yCnbWv0PxxPuShF8YR9Zjru8ayeqpN8PTBNDWuR08NUYl4r
b1G94EPEGv+7I5H4rHjLU7X2ecxMJzjyYghyhf7VHajbe+/ga59K34lT98aEdtSx
UkKqZAr4j7HpofNiL9U2FkGQL5f0NaG3K6KJESKSyfdYV+ONKCy1gt/gDdjdclXl
TWkay0QbKPJaRmrf
=XLI0
-----END PGP SIGNATURE-----
