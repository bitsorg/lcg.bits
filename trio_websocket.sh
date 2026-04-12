package: trio_websocket
description: trio_websocket Python package
version: "0.11.1"
tag: "0.11.1"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/trio-websocket-0.11.1.tar.gz
requires:
  - Python
  - pip
  - arrow
  - trio
  - wsproto
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