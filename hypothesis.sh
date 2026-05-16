package: hypothesis
description: Hypothesis property-based testing library for Python
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
license: MPL-2.0
---
#!/bin/bash -e
##############################
. $(bits-include PythonRecipe)
##############################
MODULE_OPTIONS="--python"
##############################