package: professor
description: professor Monte Carlo event generator
version: "2.5.6"
tag: "2.5.6"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/MCGeneratorsTarFiles/professor-2.5.6.tar.gz
requires:
  - Python
  - cython
  - matplotlib
  - numpy
  - yoda
  - sympy
  - eigen
  - pip
  - wheel
  - iminuit
  - ROOT
build_requires:
  - bits-recipe-tools
license: TODO
---
#!/bin/bash -e
##############################
. $(bits-include AutoToolsRecipe)
##############################
MODULE_OPTIONS="--bin --lib"
##############################
function Configure() {
  rsync -a --delete --exclude '**/.git' $SOURCEDIR/ .
  ./configure --prefix=$INSTALLROOT --with-eigen=${eigen_ROOT} URL ${gen_url}/professor-2.5.6.tar.gz
}
