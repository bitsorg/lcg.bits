package: pcre
description: PCRE Perl Compatible Regular Expressions library (version 1)
version: "8.43"
tag: "8.43"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/pcre-8.43.tar.gz
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: BSD-3-Clause
---
#!/bin/bash -e
##############################
. $(bits-include AutoToolsRecipe)
##############################
MODULE_OPTIONS="--bin --lib --cmake"
##############################
function Configure() {
  ./configure --prefix="$INSTALLROOT" \
    --enable-utf \
    --enable-jit \
    --enable-unicode-properties \
    CC=$CC CXX=$CXX
}
