package: pyserial
description: pyserial Python serial port access library
version: "3.4"
tag: "3.4"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/pyserial-3.4.tar.gz
requires:
  - Python
  - setuptools
build_requires:
  - bits-recipe-tools
license: BSD-3-Clause
---
#!/bin/bash -e
##############################
. $(bits-include PythonRecipe)
##############################
MODULE_OPTIONS="--python"
##############################