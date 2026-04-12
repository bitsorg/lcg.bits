package: webencodings
description: webencodings library/tool (from LCG software stack)
version: "0.5.1"
tag: "0.5.1"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/webencodings-0.5.1.tar.gz
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