package: singledispatch
description: singledispatch backport of functools.singledispatch
version: "3.4.0.3"
tag: "3.4.0.3"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/singledispatch-3.4.0.3.tar.gz
requires:
  - Python
  - setuptools
  - six
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