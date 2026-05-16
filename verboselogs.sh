package: verboselogs
description: verboselogs verbose logging level additions for Python
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
license: MIT
---
#!/bin/bash -e
##############################
. $(bits-include PythonRecipe)
##############################
MODULE_OPTIONS="--python"
##############################