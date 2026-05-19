package: terminado
description: terminado tornado and gevent WebSocket terminal server
version: "0.18.1"
tag: "0.18.1"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/terminado-0.18.1.tar.gz
requires:
  - Python
  - tornado
  - ptyprocess
  - pip
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