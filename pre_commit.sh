package: pre_commit
description: pre-commit framework for managing git pre-commit hooks
version: "3.8.0"
tag: "3.8.0"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/pre_commit-3.8.0.tar.gz
requires:
  - Python
  - PyYAML
  - virtualenv
  - distlib
  - filelock
  - platformdirs
  - cfgv
  - identify
  - nodeenv
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: MIT
---
#!/bin/bash -e
##############################
. $(bits-include PythonRecipe)
##############################
MODULE_OPTIONS="--bin --python"
##############################