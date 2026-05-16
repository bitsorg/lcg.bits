package: aiofile
description: aiofile async file operations for Python asyncio
version: "3.9.0"
tag: "3.9.0"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/aiofile-3.9.0.tar.gz
requires:
  - Python
  - pip
  - caio
build_requires:
  - bits-recipe-tools
license: Apache-2.0
---
#!/bin/bash -e
##############################
. $(bits-include PythonRecipe)
##############################
MODULE_OPTIONS="--python"
##############################