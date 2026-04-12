package: fonttools
description: fonttools Python package
version: "4.40.0"
tag: "4.40.0"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/fonttools-4.40.0.tar.gz
requires:
  - Python
  - pip
  - fs
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