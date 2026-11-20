package: nbclassic
description: nbclassic classic Jupyter Notebook interface
version: "1.3.3"
tag: "1.3.3"
requires:
  - jupyter_server
  - babel
  - ipykernel
  - notebook_shim
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