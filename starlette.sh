package: starlette
description: Starlette lightweight async web framework for Python
version: "0.48.0"
tag: "0.48.0"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/starlette-0.48.0.tar.gz
requires:
  - Python
  - setuptools
  - pip
  - anyio
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