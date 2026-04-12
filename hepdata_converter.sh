package: hepdata_converter
description: hepdata_converter Python package
version: "0.3.1"
tag: "0.3.1"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/hepdata-converter-0.3.1.tar.gz
requires:
  - Python
  - setuptools
  - matplotlib
  - hepdata_validator
  - PyYAML
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