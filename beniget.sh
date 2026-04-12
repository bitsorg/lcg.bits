package: beniget
description: beniget Python package
version: "0.4.2.post1"
tag: "0.4.2.post1"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/beniget-0.4.2.post1.tar.gz
requires:
  - Python
  - setuptools
  - gast
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