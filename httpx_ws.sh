package: httpx_ws
description: httpx_ws Python package
version: "0.7.1"
tag: "0.7.1"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/httpx_ws-0.7.1.tar.gz
requires:
  - Python
  - pip
  - wsproto
  - anyio
  - httpcore
  - httpx
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