package: stack_data
description: stack_data Python package
version: "0.6.3"
tag: "0.6.3"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/stack_data-0.6.3.tar.gz
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