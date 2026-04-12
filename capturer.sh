package: capturer
description: capturer Python package
version: "3.0"
tag: "3.0"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/capturer-3.0.tar.gz
requires:
  - Python
  - setuptools
  - pip
  - humanfriendly
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