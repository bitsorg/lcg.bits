package: pyasn1
description: pyasn1 Python package
version: "0.6.1"
tag: "0.6.1"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/pyasn1-0.6.1.tar.gz
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