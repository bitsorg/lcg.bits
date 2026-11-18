package: func_adl
description: func_adl functional analysis description language for HEP
version: "3.4.2"
tag: "3.4.2"
requires:
  - Python
  - make_it_sync
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