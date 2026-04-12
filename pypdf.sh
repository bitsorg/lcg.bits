package: pypdf
description: pypdf Python package
version: "3.11.0"
tag: "3.11.0"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/pypdf-3.11.0.tar.gz
requires:
  - Python
  - pip
  - typing_extensions
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