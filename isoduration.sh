package: isoduration
description: isoduration Python package
version: "20.11.0"
tag: "20.11.0"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/isoduration-20.11.0.tar.gz
requires:
  - Python
  - pip
  - pypi_arrow
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