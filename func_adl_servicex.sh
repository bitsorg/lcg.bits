package: func_adl_servicex
description: func_adl_servicex Python package
version: "2.1"
tag: "2.1"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/func_adl_servicex-2.1.tar.gz
requires:
  - Python
  - setuptools
  - pip
  - func_adl
  - qastle
  - servicex
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