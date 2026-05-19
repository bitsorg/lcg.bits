package: archspec
description: archspec library for detecting CPU microarchitecture
version: "0.1.4"
tag: "0.1.4"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/archspec-0.1.4.tar.gz
requires:
  - Python
  - click
  - six
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: Apache-2.0 OR MIT
---
#!/bin/bash -e
##############################
. $(bits-include PythonRecipe)
##############################
MODULE_OPTIONS="--bin --python"
##############################