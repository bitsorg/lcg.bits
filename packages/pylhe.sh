package: pylhe
description: pylhe lightweight Python interface to Les Houches Event files
version: "1.0.1"
tag: "1.0.1"
requires:
  - Python
  - awkward
  - graphviz_py
  - particle
  - vector
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