package: aiohttp_cors
description: aiohttp_cors CORS support for aiohttp servers
version: "0.7.0"
tag: "0.7.0"
requires:
  - Python
  - aiohttp
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: Apache-2.0
---
#!/bin/bash -e
##############################
. $(bits-include PythonPipRecipe)
##############################
MODULE_OPTIONS="--bin --python"
##############################