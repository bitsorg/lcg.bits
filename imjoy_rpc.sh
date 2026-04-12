package: imjoy_rpc
description: imjoy_rpc Python package
version: "0.5.59"
tag: "0.5.59"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/imjoy-rpc-0.5.59.tar.gz
requires:
  - Python
  - pip
  - shortuuid
  - websockets
  - msgpack
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