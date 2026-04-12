package: parse
description: parse Python package
version: "1.20.2"
tag: "1.20.2"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/parse-1.20.2.tar.gz
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