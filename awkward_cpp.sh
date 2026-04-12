package: awkward_cpp
description: awkward_cpp Python package
version: "52"
tag: "52"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/awkward_cpp-52.tar.gz
requires:
  - numpy
  - pytest_runner
  - PyYAML
  - arrow
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