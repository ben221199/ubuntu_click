SUBDIRS = integration

NULL =

noinst_DATA = preload.gir
CLEANFILES = $(noinst_DATA)

preload.gir: preload.h
	PKG_CONFIG_PATH=$(top_builddir)/lib/click g-ir-scanner \
		-n preload --nsversion 0 -l c \
		--pkg glib-2.0 --pkg gee-0.8 --pkg json-glib-1.0 \
		--pkg click-0.4 \
		-I$(top_builddir)/lib/click -L$(top_builddir)/lib/click \
		--accept-unprefixed --warn-all \
		--libtool "$(LIBTOOL)" \
		$< --output $@

noinst_SCRIPTS = test_database.py \
                 test_paths.py \
                 $(NULL)
CLEANFILES += $(noinst_SCRIPTS)

do_subst = sed \
	-e 's,[@]sysconfdir[@],$(sysconfdir),g' \
	-e 's,[@]pkgdatadir[@],$(pkgdatadir),g' \
	-e 's,[@]DEFAULT_ROOT[@],$(DEFAULT_ROOT),g' \
	$(NULL)

test_database.py: test_database.py.in Makefile
	$(do_subst) < $(srcdir)/test_database.py.in > $@

test_paths.py: test_paths.py.in Makefile
	$(do_subst) < $(srcdir)/test_paths.py.in > $@
