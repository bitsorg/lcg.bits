package: jupyter_client
description: jupyter_client Jupyter protocol client and kernel management
version: "7.4.9"
tag: "7.4.9"
requires:
  - Python
  - jupyter_core
  - traitlets
  - pyzmq
  - python_dateutil
  - tornado
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