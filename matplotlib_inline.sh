package: matplotlib_inline
description: matplotlib-inline inline Matplotlib backend for IPython
version: "0.1.7"
tag: "0.1.7"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/matplotlib_inline-0.1.7.tar.gz
requires:
  - Python
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