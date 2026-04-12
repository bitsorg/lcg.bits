package: tabulate
description: tabulate Python package
version: "0.9.0"
tag: "0.9.0"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/tabulate-0.9.0.tar.gz
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