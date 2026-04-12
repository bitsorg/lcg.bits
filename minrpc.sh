package: minrpc
description: minrpc Python package
version: "0.2.0"
tag: "0.2.0"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/minrpc-0.2.0.tar.gz
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