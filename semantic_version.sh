package: semantic_version
description: semantic_version Python package
version: "2.10.0"
tag: "2.10.0"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/semantic_version-2.10.0.tar.gz
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