package: pyxxhash
description: pyxxhash Python package
version: "3.5.0"
tag: "3.5.0"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/xxhash-3.5.0.tar.gz
requires:
  - Python
  - pip
  - xxHash
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