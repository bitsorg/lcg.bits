package: kt_legacy
description: kt_legacy Python package
version: "1.0.5"
tag: "1.0.5"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/kt_legacy-1.0.5.tar.gz
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