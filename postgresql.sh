package: postgresql
description: PostgreSQL open-source relational database system
version: "17.5"
tag: "17.5"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/%(name)s-%(version)s.tar.gz
requires:
  - yacc-like
  - m4
  - pkg_config
  - gettext
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: PostgreSQL
---
#!/bin/bash -e
##############################
. $(bits-include AutoToolsRecipe)
##############################
MODULE_OPTIONS="--bin --lib"
##############################
function Configure() {
  # --without-readline: the bits readline.so has an unresolved ncurses 'UP'
  # symbol that crashes gawk during configure probes; readline is only used
  # by the psql interactive client and is not needed for the server libraries.
  ./configure --prefix="$INSTALLROOT" \
    --without-icu \
    --without-readline \
    --with-gettext="${GETTEXT_ROOT}" \
    --enable-thread-safety
}
