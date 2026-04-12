package: hepdata_lib
description: hepdata_lib Python package
version: "0.20.0"
tag: "0.20.0"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/hepdata_lib-0.20.0.tar.gz
requires:
  - Python
  - pip
  - setuptools
  - hepdata_validator
  - PyYAML
  - scipy
  - ROOT
  - hist
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