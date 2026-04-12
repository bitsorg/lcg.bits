package: pickleshare
description: pickleshare Python package
version: "0.7.5"
tag: "0.7.5"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/pickleshare-0.7.5.tar.gz
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