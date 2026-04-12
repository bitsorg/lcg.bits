package: nest_asyncio
description: nest_asyncio Python package
version: "1.6.0"
tag: "1.6.0"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/nest_asyncio-1.6.0.tar.gz
requires:
  - Python
  - setuptools
build_requires:
  - bits-recipe-tools
license: TODO
---
#!/bin/bash -e
##############################
. $(bits-include PythonRecipe)
##############################
MODULE_OPTIONS="--python"
##############################