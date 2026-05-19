package: asdf
description: ASDF Advanced Scientific Data Format Python library
version: "3.5.0"
tag: "3.5.0"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/asdf-3.5.0.tar.gz
requires:
  - Python
  - asdf_standard
  - asdf_transform_schemas
  - semantic_version
  - jmespath
  - attrs
  - importlib_metadata
  - numpy
  - packaging
  - PyYAML
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: BSD-3-Clause
---
#!/bin/bash -e
##############################
. $(bits-include PythonRecipe)
##############################
MODULE_OPTIONS="--bin --python"
##############################