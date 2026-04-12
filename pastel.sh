package: pastel
description: pastel Python package
version: "0.2.1"
tag: "0.2.1"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/pastel-0.2.1.tar.gz
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