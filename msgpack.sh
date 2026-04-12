package: msgpack
description: msgpack Python package
version: "1.0.5"
tag: "1.0.5"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/msgpack-1.0.5.tar.gz
requires:
  - Python
  - pip
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