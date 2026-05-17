package: strip_hints
description: strip-hints remove Python type hints from source code
version: "0.1.13"
tag: "0.1.13"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/strip-hints-0.1.13.tar.gz
requires:
  - Python
  - six
  - wheel
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