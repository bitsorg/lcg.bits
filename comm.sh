package: comm
description: comm Jupyter kernel communication protocol library
version: "0.2.2"
tag: "0.2.2"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/comm-0.2.2.tar.gz
requires:
  - Python
  - pip
  - traitlets
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