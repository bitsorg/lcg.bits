package: urllib3
description: urllib3 Python package
version: "2.6.3"
tag: "2.6.3"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/urllib3-2.6.3.tar.gz
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