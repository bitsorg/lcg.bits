package: lazy_loader
description: lazy_loader Python package
version: "0.4"
tag: "0.4"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/lazy_loader-0.4.tar.gz
requires:
  - Python
  - pip
  - setuptools
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