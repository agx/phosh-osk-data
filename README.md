# phosh osk data

Scripts to build word prediction data for [phosh-osk-stub][] and other presage
based completers. The aim here is to have models that are distributable without
licensing issues and using modern language so we're using Wikipedia dumps.

## Building your own dictionaries based in Wikipedia data

Get a host with disk space (~40G), more cores make the first steps
(extraction and parsing into sentences significantly faster.

You can then provision it with the provided ansible playbook on your
cloud provider of choice:

```sh
   ansible-playbook -v -i "${BUILDER}", -u root  builder/setup.yml
```

`${BUILDER}` is the IP or hostname of the host to provision.

Once there get the Wikipedia dump:

```sh
ssh ${BUILDER}
cd output/
export LANG=es
wget "https://dumps.wikimedia.org/${LANG}wiki/latest/${LANG}wiki-latest-pages-articles.xml.bz2"
```

Import some nltk data:

```
python3 -c "import nltk; nltk.download('punkt')"
```

Process the dump

```
./pod-db-from-wiki-dump --processes 4 --language "${LANG}" --dump "output/${LANG}wiki-latest-pages-articles.xml.bz2" --output  "output/${LANG}"
```

You'll then get a database usable by presage based completers in `output/${LANG}/database_${LANG}.db`.

This happens in steps so should a step fail you can skip it in subsequent runs.
See the `--skip-*` options. The extract and parsing steps happen in parallel
and can be spread over multiple cores (default `8`).

## Installing the data

See the [phosh-data-packager manpage](doc/phosh-osk-data-packager.rst).

## Related projects

- presage: <http://presage.sourceforge.net/>
- sfos presage databases: <https://github.com/sailfish-keyboard/presage-database>
- phosh-osk-stub: <https://gitlab.gnome.org/guidog/phosh-osk-stub>

[phosh-osk-stub]: https://gitlab.gnome.org/guidog/phosh-osk-stub
