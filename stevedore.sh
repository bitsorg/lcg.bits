package: stevedore
description: stevedore Python package
version: "3.3.0"
tag: "3.3.0"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/stevedore-3.3.0.tar.gz
requires:
  - Python
  - setuptools
  - pbr
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