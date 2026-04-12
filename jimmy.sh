package: jimmy
description: jimmy Monte Carlo event generator
version: "4.31.3"
tag: "4.31.3"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/MCGeneratorsTarFiles/jimmy-4.31.3-src.tgz
requires:
  - herwig
build_requires:
  - bits-recipe-tools
license: TODO
patches:
  - jimmy-4.31.3.patch
---
#!/bin/bash -e
##############################
. $(bits-include AutoToolsRecipe)
##############################
MODULE_OPTIONS="--bin --lib"
##############################
function Configure() {
  rsync -a --delete --exclude '**/.git' $SOURCEDIR/ .
  ./configure --with-herwig=${herwig_ROOT}
}
