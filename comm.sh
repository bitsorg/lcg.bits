package: comm
description: comm Python package
version: "0.2.2"
tag: "0.2.2"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/comm-0.2.2.tar.gz
requires:
  - Python
  - pip
  - traitlets
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