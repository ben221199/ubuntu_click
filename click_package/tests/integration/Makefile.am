NULL =
CLEANFILES =

noinst_SCRIPTS = test_hook.py \
                 test_info.py \
                 test_install.py \
                 $(NULL) 
CLEANFILES += $(noinst_SCRIPTS)

do_subst = sed \
	-e 's,[@]DEFAULT_ROOT[@],$(DEFAULT_ROOT),g' \
	$(NULL)

test_hook.py: test_hook.py.in Makefile
	$(do_subst) < $(srcdir)/test_hook.py.in > $@

test_info.py: test_info.py.in Makefile
	$(do_subst) < $(srcdir)/test_info.py.in > $@

test_install.py: test_install.py.in Makefile
	$(do_subst) < $(srcdir)/test_install.py.in > $@
