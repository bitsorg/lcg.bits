package: pyslha
description: pyslha Python package
version: "3.2.6"
tag: "3.2.6"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/pyslha-3.2.6.tar.gz
requires:
  - Python
  - setuptools
  - tex2pix
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