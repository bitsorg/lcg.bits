package: pycpuinfo
description: pycpuinfo Python package
version: "9.0.0"
tag: "9.0.0"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/py-cpuinfo-9.0.0.tar.gz
requires:
  - Python
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