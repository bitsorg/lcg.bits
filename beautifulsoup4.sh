package: beautifulsoup4
description: beautifulsoup4 Python package
version: "4.10.0"
tag: "4.10.0"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/beautifulsoup4-4.10.0.tar.gz
requires:
  - Python
  - setuptools
  - soupsieve
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