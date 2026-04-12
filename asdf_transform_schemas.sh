package: asdf_transform_schemas
description: asdf_transform_schemas Python package
version: "0.5.0"
tag: "0.5.0"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/asdf_transform_schemas-0.5.0.tar.gz
requires:
  - Python
  - pip
  - asdf_standard
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