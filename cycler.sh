package: cycler
description: cycler Python package
version: "0.12.1"
tag: "0.12.1"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/cycler-0.12.1.tar.gz
requires:
  - Python
  - setuptools
  - six
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