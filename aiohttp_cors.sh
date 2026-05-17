package: aiohttp_cors
description: aiohttp_cors CORS support for aiohttp servers
version: "0.7.0"
tag: "0.7.0"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/aiohttp-cors-0.7.0.tar.gz
requires:
  - Python
  - pip
  - aiohttp
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