package: uvicorn
description: Uvicorn lightning-fast ASGI server for Python
version: "0.37.0"
tag: "0.37.0"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/uvicorn-0.37.0.tar.gz
requires:
  - Python
  - pip
  - gunicorn
  - click
  - h11
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