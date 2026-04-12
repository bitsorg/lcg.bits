package: make_it_sync
description: make_it_sync Python package
version: "2.0.0"
tag: "2.0.0"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/make-it-sync-2.0.0.tar.gz
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