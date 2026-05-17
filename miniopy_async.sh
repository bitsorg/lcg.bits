package: miniopy_async
description: miniopy-async async MinIO Python client
version: "1.21.1"
tag: "1.21.1"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/miniopy_async-1.21.1.tar.gz
requires:
  - Python
  - pip
  - aiofile
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