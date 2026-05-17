package: harfbuzz
description: HarfBuzz OpenType text shaping engine
version: "2.7.4"
tag: "2.7.4"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/harfbuzz-2.7.4.tar.gz
requires:
  - freetype
  - glib
  - cairo
  - libffi
  - pkg_config
  - gettext
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: MIT
---
#!/bin/bash -e
##############################
. $(bits-include AutoToolsRecipe)
##############################
MODULE_OPTIONS="--bin --lib"
##############################
function Configure() {
  rsync -a --delete --exclude '**/.git' $SOURCEDIR/ .
  ./configure --prefix=$INSTALLROOT --with-cairo --with-freetype --with-glib
}
