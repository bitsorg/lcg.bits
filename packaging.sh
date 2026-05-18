package: packaging
description: packaging Python packaging utilities (version, tags...)
version: "24.2"
tag: "24.2"
requires:
  - Python
  - pip
  - setuptools
  - pyparsing
  - six
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: Apache-2.0 OR BSD-2-Clause
---
#!/bin/bash -e
##############################
. $(bits-include PythonPipRecipe)
##############################
MODULE_OPTIONS="--bin --python"
##############################
