package: traitlets
description: traitlets typed Python attributes with observability
version: "5.14.3"
tag: "5.14.3"
requires:
  - Python
  - six
  - decorator
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: BSD-3-Clause
---
#!/bin/bash -e
##############################
. $(bits-include PythonPipRecipe)
##############################
MODULE_OPTIONS="--bin --python"
##############################