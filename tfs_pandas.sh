package: tfs_pandas
description: tfs_pandas Python package
version: "4.0.0"
tag: "4.0.0"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/tfs-pandas-4.0.0.tar.gz
requires:
  - Python
  - setuptools
  - pandas
  - numpy
  - pip
  - pytables
build_requires:
  - bits-recipe-tools
license: TODO
---
#!/bin/bash -e
##############################
. $(bits-include PythonRecipe)
##############################
MODULE_OPTIONS="--python"
##############################