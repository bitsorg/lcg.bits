package: humanize
description: humanize Python humanization utilities
version: "4.0.0"
tag: "4.0.0"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/humanize-4.0.0.tar.gz
requires:
  - Python
  - setuptools
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