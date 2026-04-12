package: tornado
description: tornado Python package
version: "6.4.1"
tag: "6.4.1"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/tornado-6.4.1.tar.gz
requires:
  - Python
  - setuptools
  - certifi
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