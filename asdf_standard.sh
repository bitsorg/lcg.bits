package: asdf_standard
description: ASDF standard schema definitions
version: "1.1.1"
tag: "1.1.1"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/asdf_standard-1.1.1.tar.gz
requires:
  - Python
  - pip
build_requires:
  - bits-recipe-tools
license: BSD-3-Clause
---
#!/bin/bash -e
##############################
. $(bits-include PythonRecipe)
##############################
MODULE_OPTIONS="--python"
##############################