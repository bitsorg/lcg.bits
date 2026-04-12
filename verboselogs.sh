package: verboselogs
description: verboselogs Python package
version: "1.7"
tag: "1.7"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/verboselogs-1.7.tar.gz
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