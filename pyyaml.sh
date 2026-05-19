package: PyYAML
description: PyYAML YAML parser and emitter for Python
version: "6.0.2"
tag: "6.0.2"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/PyYAML-6.0.2.tar.gz
requires:
  - Python
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