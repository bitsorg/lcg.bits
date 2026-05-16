package: jsonpointer
description: jsonpointer resolve/set values in JSON via JSON Pointer
version: "2.0"
tag: "2.0"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/jsonpointer-2.0.tar.gz
requires:
  - Python
  - setuptools
build_requires:
  - bits-recipe-tools
license: BSD-3-Clause
---
#!/bin/bash -e
##############################
. $(bits-include PythonRecipe)
##############################
MODULE_OPTIONS="--python"
##############################