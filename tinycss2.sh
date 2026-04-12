package: tinycss2
description: tinycss2 Python package
version: "1.2.1"
tag: "1.2.1"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/tinycss2-1.2.1.tar.gz
requires:
  - Python
  - pip
  - webencodings
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