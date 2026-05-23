package: libxslt
description: libxslt XSLT C library for GNOME
version: "1.1.38"
tag: "1.1.38"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/%(name)s-%(version)s.tar.gz
requires:
  - libxml2
prefer_system: ".*"
prefer_system_check:

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
  # GCC 15 defaults to C23, which forbids implicit function declarations.
  # libxslt 1.1.38 predates C23; build it as gnu17 to avoid false errors.
  export CFLAGS="${CFLAGS} -std=gnu17"
  ./configure --prefix=$INSTALLROOT --without-python
}
