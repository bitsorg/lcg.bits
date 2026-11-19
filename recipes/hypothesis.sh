package: hypothesis
description: Hypothesis property-based testing library for Python
version: "6.135.1"
tag: "6.135.1"
requires:
  - Python
  - attrs
  - sortedcontainers
  - click
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: MPL-2.0
---
#!/bin/bash -e
##############################
. $(bits-include PythonPipRecipe)
##############################
MODULE_OPTIONS="--bin --python"
##############################