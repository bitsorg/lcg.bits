package: hypothesis
description: hypothesis Python package
version: "6.135.1"
tag: "6.135.1"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/hypothesis-6.135.1.tar.gz
requires:
  - Python
  - setuptools
  - attrs
  - sortedcontainers
  - click
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