package: wsproto
description: wsproto pure-Python WebSocket/HTTP implementation
version: "1.2.0"
tag: "1.2.0"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/wsproto-1.2.0.tar.gz
requires:
  - Python
  - pip
  - h11
build_requires:
  - bits-recipe-tools
license: MIT
---
#!/bin/bash -e
##############################
. $(bits-include PythonRecipe)
##############################
MODULE_OPTIONS="--python"
##############################