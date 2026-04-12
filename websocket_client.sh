package: websocket_client
description: websocket_client Python package
version: "1.8.0"
tag: "1.8.0"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/websocket_client-1.8.0.tar.gz
requires:
  - Python
  - setuptools
  - six
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