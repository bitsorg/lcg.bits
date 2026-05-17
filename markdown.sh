package: markdown
description: Markdown Python implementation of Markdown
version: "3.7"
tag: "3.7"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/Markdown-3.7.tar.gz
requires:
  - Python
  - setuptools
  - pip
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