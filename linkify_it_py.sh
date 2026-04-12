package: linkify_it_py
description: linkify_it_py Python package
version: "2.0.2"
tag: "2.0.2"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/linkify-it-py-2.0.2.tar.gz
requires:
  - Python
  - setuptools
  - pip
  - uc_micro_py
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