TEXT2NGRAM=text2ngram

IN := $(wildcard input/database_*.txt)
INPUT_NAMES := $(notdir $(IN))
OUT := $(addprefix out/,$(INPUT_NAMES:.txt=.db))
DIR=/usr/share/phosh/osk/presage

all: $(OUT)

out/%.db: input/%.txt
	mkdir -p out
	rm -f $@
	$(TEXT2NGRAM) -n 1 -l -f sqlite -o $@ $^
	$(TEXT2NGRAM) -n 2 -l -f sqlite -o $@ $^
	$(TEXT2NGRAM) -n 3 -l -f sqlite -o $@ $^

install: $(OUT)
	install -D -t $(DESTDIR)$(DIR) -m 0644 $(OUT)

clean:
	rm -rf out/ tmp/
