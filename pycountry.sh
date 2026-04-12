package: pycountry
description: pycountry Python package
version: "24.6.1"
tag: "24.6.1"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/pycountry-24.6.1.tar.gz
requires:
  - Python
  - setuptools
  - pip
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