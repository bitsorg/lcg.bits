package: isodate
description: isodate Python package
version: "0.7.2"
tag: "0.7.2"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/isodate-0.7.2.tar.gz
requires:
  - Python
  - setuptools
  - six
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