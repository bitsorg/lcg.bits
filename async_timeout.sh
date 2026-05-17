package: async_timeout
description: async-timeout timeout context manager for asyncio
version: "4.0.2"
tag: "4.0.2"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/async-timeout-4.0.2.tar.gz
requires:
  - Python
  - setuptools
  - pip
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: Apache-2.0
---
#!/bin/bash -e
##############################
. $(bits-include PythonRecipe)
##############################
MODULE_OPTIONS="--bin --python"
##############################