package: pylhe
description: pylhe Python package
version: "1.0.1"
tag: "1.0.1"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/pylhe-1.0.1.tar.gz
requires:
  - Python
  - pip
  - awkward
  - graphviz_py
  - particle
  - vector
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