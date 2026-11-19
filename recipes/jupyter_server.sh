package: jupyter_server
description: jupyter_server backend server for Jupyter web apps
version: "2.21.0"
tag: "2.21.0"
requires:
  - anyio
  - Jinja2
  - tornado
  - pyzmq
  - traitlets
  - jupyter_core
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