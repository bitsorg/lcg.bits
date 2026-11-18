package: jupyter_lsp
description: jupyter-lsp Language Server Protocol support for JupyterLab
version: "2.2.5"
tag: "2.2.5"
requires:
  - Python
  - jupyter_server
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