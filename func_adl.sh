package: func_adl
description: func_adl Python package
version: "3.4.2"
tag: "3.4.2"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/func_adl-3.4.2.tar.gz
requires:
  - Python
  - setuptools
  - pip
  - make_it_sync
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