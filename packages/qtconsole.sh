package: qtconsole
description: qtconsole Qt-based rich Jupyter terminal
version: "5.6.1"
tag: "5.6.1"
requires:
  - Python
  - ipykernel
  - jupyter_client
  - pygments
  - traitlets
  - jupyter_core
  - Qt5
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