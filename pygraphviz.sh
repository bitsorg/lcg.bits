package: pygraphviz
description: PyGraphviz Python interface to Graphviz graph library
version: "1.11"
tag: "1.11"
requires:
  - Python
  - graphviz
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