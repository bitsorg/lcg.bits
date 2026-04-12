package: pbr
description: pbr Python package
version: "6.0.0"
tag: "6.0.0"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/pbr-6.0.0.tar.gz
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