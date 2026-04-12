package: textual
description: textual Python package
version: "0.74.0"
tag: "0.74.0"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/textual-0.74.0.tar.gz
requires:
  - Python
  - setuptools
  - rich
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