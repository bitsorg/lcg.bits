package: nbclassic
description: nbclassic Python package
version: "1.3.3"
tag: "1.3.3"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/nbclassic-1.3.3.tar.gz
requires:
  - jupyter_server
  - pip
  - babel
  - ipykernel
  - notebook_shim
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