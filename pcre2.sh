package: pcre2
description: PCRE2 Perl-compatible regular expressions library (v2)
version: "10.42"
tag: "10.42"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/pcre2-10.42.tar.gz
build_requires:
  - bits-recipe-tools
license: BSD-3-Clause
---
#!/bin/bash -e
##############################
. $(bits-include CMakeRecipe)
##############################
MODULE_OPTIONS="--bin --lib"
##############################
function Configure() {
  cmake $SOURCEDIR \
    -DCMAKE_INSTALL_PREFIX=$INSTALLROOT \
    -DCMAKE_BUILD_TYPE=Release \
    -DPCRE2_SUPPORT_JIT=ON \
    -DBUILD_SHARED_LIBS=ON \
    --enable-jit \
    --prefix=$INSTALLROOT
}
