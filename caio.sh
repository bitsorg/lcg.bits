package: caio
description: caio Python package
version: "0.9.25"
tag: "0.9.25"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/caio-0.9.25.tar.gz
requires:
  - Python
  - pip
build_requires:
  - bits-recipe-tools
license: TODO
patches:
  - caio-0.9.25.patch
---
#!/bin/bash -e
##############################
. $(bits-include PythonRecipe)
##############################
MODULE_OPTIONS="--python"
##############################