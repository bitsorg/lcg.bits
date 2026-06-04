package: flex
description: flex fast lexical analyser generator
version: "2.6.4"
tag: "2.6.4"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/%(name)s-%(version)s.tar.gz
requires:
  - bison
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: BSD-2-Clause
---
#!/bin/bash -e
##############################
. $(bits-include AutoToolsRecipe)
##############################
MODULE_OPTIONS="--bin --lib"
##############################
function Configure() {
  # Build in-source (AutoToolsRecipe rsyncs the source into cwd), matching
  # lcgcmake's flex (configure --prefix; make; make install; BUILD_IN_SOURCE).
  ./configure --prefix="$INSTALLROOT"
}
