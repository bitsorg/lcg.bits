package: hypothesis
description: Hypothesis property-based testing library for Python
version: "6.135.1"
tag: "6.135.1"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/hypothesis-6.135.1.tar.gz
requires:
  - Python
  - attrs
  - sortedcontainers
  - click
  - pip
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: MPL-2.0
---
#!/bin/bash -e
##############################
. $(bits-include PythonRecipe)
##############################
MODULE_OPTIONS="--bin --python"
##############################