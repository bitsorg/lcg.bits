package: tornado
description: Tornado scalable async network library for Python
version: "6.4.1"
tag: "6.4.1"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/tornado-6.4.1.tar.gz
requires:
  - Python
  - certifi
  - pip
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: Apache-2.0
---
#!/bin/bash -e
##############################
. $(bits-include PythonRecipe)
##############################
MODULE_OPTIONS="--bin --python"
##############################