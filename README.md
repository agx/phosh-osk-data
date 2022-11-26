phosh osk data
==============

Data files to build word prediction data for phosh-osk-stub and other presage
based completers. The aim here is to have models that are distributable without
licensing issues. If there's better sources, please let me know.

# To add a new language
- Find suitable data to download (e.g. at https://www.gutenberg.org/ )
- Download it in [`fetch`](./fetch). Make sure the result is utf-8 encoded
- Add copyright and license information to [debian/copyright](./debian/copyright)
- Build the models:

```
./fetch
make
DESTDIR=installdir make install
```

# Related projects
- presage: http://presage.sourceforge.net/
- sfos presage databases: https://github.com/sailfish-keyboard/presage-database
- phosh-osk-stub: https://gitlab.gnome.org/guidog/phosh-osk-stub
