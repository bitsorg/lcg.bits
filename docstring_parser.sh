package: docstring_parser
description: docstring_parser Python package
version: "0.15"
tag: "0.15"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/docstring_parser-0.15.tar.gz
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