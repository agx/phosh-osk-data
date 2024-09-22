MANPAGES = \
	phosh-osk-data-packager.1 \
	$(NULL)

%.1: %.rst
	rst2man --syntax-highlight=none $< > $@.tmp
	mv $@.tmp $@

doc: $(MANPAGES)

clean:
	rm -f *.1
