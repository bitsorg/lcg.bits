package: send2trash
description: send2trash Python package
version: "1.8.3"
tag: "1.8.3"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/Send2Trash-1.8.3.tar.gz
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