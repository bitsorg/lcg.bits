package: pathspec
description: pathspec Python package
version: "0.11.1"
tag: "0.11.1"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/pathspec-0.11.1.tar.gz
requires:
  - Python
  - setuptools
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