package: pathspec
description: pathspec utility library for pattern matching file paths
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
license: MPL-2.0
---
#!/bin/bash -e
##############################
. $(bits-include PythonRecipe)
##############################
MODULE_OPTIONS="--python"
##############################