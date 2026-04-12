package: importlib_resources
description: importlib_resources Python package
version: "6.5.2"
tag: "6.5.2"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/importlib_resources-6.5.2.tar.gz
requires:
  - Python
  - pip
  - zipp
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