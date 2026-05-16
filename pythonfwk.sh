package: PythonFWK
description: PythonFWK Python framework base for LCG software
version: "unknown"
tag: "unknown"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/Python-unknown.tgz
requires:
  - openssl
build_requires:
  - bits-recipe-tools
license: GPL-3.0-or-later
---
#!/bin/bash -e
##############################
. $(bits-include AutoToolsRecipe)
##############################
MODULE_OPTIONS="--bin --lib"
##############################
function Configure() {
  $SOURCEDIR/configure --prefix=$INSTALLROOT DYNLOADFILE=dynload_shlib.o --enable-framework=$INSTALLROOT/Library/Frameworks --exec-prefix=$INSTALLROOT/Library/Frameworks/Python.framework/Versions/Current --enable-unicode=ucs4 ${Python_config_options}
}
