package: pygments
description: Pygments generic syntax highlighter for Python
version: "2.18.0"
tag: "2.18.0"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/Pygments-2.18.0.tar.gz
requires:
  - Python
  - setuptools
  - pip
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: BSD-2-Clause
---
#!/bin/bash -e
##############################
. $(bits-include PythonRecipe)
##############################
MODULE_OPTIONS="--bin --python"
##############################