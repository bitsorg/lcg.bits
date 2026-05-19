package: zlib
description: zlib lossless data compression library
version: "1.3.2"
tag: "1.3.2"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/zlib-1.3.2.tar.gz
prefer_system: ".*"
prefer_system_check: |
  printf "#include <zlib.h>\n" | cc -xc - -c -M 2>&1

build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: Zlib
---
#!/bin/bash -e
##############################
. $(bits-include AutoToolsRecipe)
##############################
MODULE_OPTIONS="--bin --lib --pkgconfig"
##############################
function Configure() {
  ./configure --prefix $INSTALLROOT
}
