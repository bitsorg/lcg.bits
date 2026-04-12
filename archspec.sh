package: archspec
description: archspec Python package
version: "0.1.4"
tag: "0.1.4"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/archspec-0.1.4.tar.gz
requires:
  - Python
  - setuptools
  - click
  - six
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