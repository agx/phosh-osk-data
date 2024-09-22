PY_SCRIPTS = \
	pod-db-from-wiki-dump \
	phosh-osk-data-packager \
	$(NULL)

check:
	flake8 --format=pylint $(PY_SCRIPTS)

man:
	$(MAKE) -C doc

clean:
	$(MAKE) -C doc clean
