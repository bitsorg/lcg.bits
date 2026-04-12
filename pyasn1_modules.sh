package: pyasn1_modules
description: pyasn1_modules Python package
version: "0.4.1"
tag: "0.4.1"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/pyasn1-modules-0.4.1.tar.gz
requires:
  - Python
  - setuptools
  - pyasn1
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