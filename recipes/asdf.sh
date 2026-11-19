package: asdf
description: ASDF Advanced Scientific Data Format Python library
version: "3.5.0"
tag: "3.5.0"
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
. $(bits-include PythonPipRecipe)
##############################
MODULE_OPTIONS="--bin --python"
##############################