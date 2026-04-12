package: threadpoolctl
description: threadpoolctl Python package
version: "3.5.0"
tag: "3.5.0"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/threadpoolctl-3.5.0.tar.gz
requires:
  - Python
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