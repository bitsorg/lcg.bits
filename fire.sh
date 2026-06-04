package: fire
description: Python Fire generates CLIs from Python objects (Google)
version: "0.7.1"
tag: "0.7.1"
requires:
  - Python
  - six
  - termcolor
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: Apache-2.0
---
#!/bin/bash -e
##############################
. $(bits-include PythonPipRecipe)
##############################
MODULE_OPTIONS="--bin --python"
##############################