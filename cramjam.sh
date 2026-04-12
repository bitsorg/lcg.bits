package: cramjam
description: cramjam Python package
version: "2.11.0"
tag: "2.11.0"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/cramjam-2.11.0.tar.gz
requires:
  - rust
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