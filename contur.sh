package: contur
description: Contur automated constraints from LHC measurements
version: "3.1.3"
tag: "3.1.3"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/MCGeneratorsTarFiles/contur-3.1.3.tar.gz
requires:
  - Python
  - setuptools
  - numpy
  - scipy
  - pandas
  - configobj
  - matplotlib
  - tqdm
  - pytest
  - PyYAML
  - pyslha
  - scikitlearn
  - click
  - pathos
  - uncertainties
  - pymysql
  - sqlparse
build_requires:
  - bits-recipe-tools
license: TODO
---
#!/bin/bash -e
##############################
. $(bits-include CMakeRecipe)
##############################
MODULE_OPTIONS="--bin --lib"
##############################
function Make() {
  rsync -a --delete --exclude '**/.git' $SOURCEDIR/ .
  make ${JOBS:+-j $JOBS}
  mkdir -p $INSTALLROOT/lib/python3/site-packages
}
