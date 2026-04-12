package: websockets
description: websockets Python package
version: "14.1"
tag: "14.1"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/websockets-14.1.tar.gz
requires:
  - Python
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