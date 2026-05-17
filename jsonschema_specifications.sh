package: jsonschema_specifications
description: jsonschema-specifications JSON Schema meta-schemas
version: "2023.7.1"
tag: "2023.7.1"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/jsonschema_specifications-2023.7.1.tar.gz
requires:
  - Python
  - pip
  - referencing
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: MIT
---
#!/bin/bash -e
##############################
. $(bits-include PythonRecipe)
##############################
MODULE_OPTIONS="--bin --python"
##############################