package: jupyter_console
description: jupyter_console terminal-based Jupyter client
version: "6.6.3"
tag: "6.6.3"
requires:
  - Python
  - ipython
  - prompt_toolkit
  - pygments
  - ipykernel
  - jupyter_core
  - jupyter_client
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