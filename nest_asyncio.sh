package: nest_asyncio
description: nest-asyncio allow nested asyncio event loops
version: "1.6.0"
tag: "1.6.0"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/nest_asyncio-1.6.0.tar.gz
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