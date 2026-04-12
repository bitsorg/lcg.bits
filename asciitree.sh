package: asciitree
description: asciitree Python package
version: "0.3.3"
tag: "0.3.3"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/asciitree-0.3.3.tar.gz
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