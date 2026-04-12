package: docutils
description: docutils Python package
version: "0.21.2"
tag: "0.21.2"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/docutils-0.21.2.tar.gz
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