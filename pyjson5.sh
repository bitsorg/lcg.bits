package: pyjson5
description: pyjson5 Python package
version: "0.9.6"
tag: "0.9.6"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/json5-0.9.6.tar.gz
requires:
  - Python
  - setuptools
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