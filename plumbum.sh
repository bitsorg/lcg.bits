package: plumbum
description: Plumbum shell combinators and CLI toolkit for Python
version: "1.9.0"
tag: "1.9.0"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/plumbum-1.9.0.tar.gz
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