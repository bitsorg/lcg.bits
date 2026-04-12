package: starlette
description: starlette Python package
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
license: TODO
---
#!/bin/bash -e
##############################
. $(bits-include PythonRecipe)
##############################
MODULE_OPTIONS="--python"
##############################