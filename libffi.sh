package: libffi
description: libffi portable foreign function interface library
version: "3.4.2"
tag: "3.4.2"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/%(name)s-%(version)s.tar.gz
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: MIT
prepend_path:
  PKG_CONFIG_PATH: "$LIBFFI_ROOT/lib/pkgconfig"
---
#!/bin/bash -e
##############################
. $(bits-include AutoToolsRecipe)
##############################
MODULE_OPTIONS="--bin --lib --pkgconfig"
##############################
function Configure() {
  ./configure --prefix=$INSTALLROOT ${_libffi_opt}
}
