package: Python
description: CPython interpreter and standard library
version: "3.14.0"
tag: "3.14.0"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/Python-3.14.0.tgz
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: Python-2.0
---
#!/bin/bash -e
##############################
. $(bits-include AutoToolsRecipe)
##############################
MODULE_OPTIONS="--bin --python"
##############################
function Configure() {
  $SOURCEDIR/configure --prefix=$INSTALLROOT ${Python_config_options} ${Python_config_flags} CXX=$CXX CC=$CC
}
