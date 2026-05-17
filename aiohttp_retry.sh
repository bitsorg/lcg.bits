package: aiohttp_retry
description: aiohttp_retry retry middleware for aiohttp
version: "2.9.1"
tag: "2.9.1"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/aiohttp_retry-2.9.1.tar.gz
requires:
  - Python
  - pip
  - aiohttp
  - aiohttp_cors
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