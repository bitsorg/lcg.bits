package: psutil
description: psutil Python package
version: "5.9.8"
tag: "5.9.8"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/psutil-5.9.8.tar.gz
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