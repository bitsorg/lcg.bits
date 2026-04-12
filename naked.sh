package: naked
description: naked Python package
version: "0.1.32"
tag: "0.1.32"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/Naked-0.1.32.tar.gz
requires:
  - Python
  - pip
  - PyYAML
  - requests
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