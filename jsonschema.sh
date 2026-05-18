package: jsonschema
description: jsonschema JSON Schema validator for Python
version: "4.23.0"
tag: "4.23.0"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/jsonschema-4.23.0.tar.gz
requires:
  - Python
  - setuptools
  - setuptools_scm
  - attrs
  - pyrsistent
  - pip
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