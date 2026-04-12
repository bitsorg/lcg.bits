package: pre_commit
description: pre_commit Python package
version: "3.8.0"
tag: "3.8.0"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/pre_commit-3.8.0.tar.gz
requires:
  - Python
  - setuptools
  - pip
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
license: TODO
---
#!/bin/bash -e
##############################
. $(bits-include PythonRecipe)
##############################
MODULE_OPTIONS="--python"
##############################