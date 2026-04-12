package: swig
description: swig library/tool (from LCG software stack)
version: "4.4.0"
tag: "4.4.0"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/swig-4.4.0.tar.gz
requires:
  - pcre2
  - Python
  - Boost
build_requires:
  - bits-recipe-tools
license: TODO
---
#!/bin/bash -e
##############################
. $(bits-include AutoToolsRecipe)
##############################
MODULE_OPTIONS="--bin"
##############################
function Configure() {
  $SOURCEDIR/configure --prefix=$INSTALLROOT --with-pcre-prefix=${pcre2_ROOT} PCRE_LIBS=${pcre2_ROOT}/lib/libpcre.a --with-boost=${Boost_ROOT}
}
