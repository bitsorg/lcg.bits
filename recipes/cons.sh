package: cons
description: cons Lisp-style cons cells for Python
version: "0.4.6"
tag: "0.4.6"
requires:
  - Python
  - logical_unification
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: MIT
---
#!/bin/bash -e
##############################
. $(bits-include PythonPipRecipe)
##############################
MODULE_OPTIONS="--bin --python"
##############################