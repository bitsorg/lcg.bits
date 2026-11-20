package: uvicorn
description: Uvicorn lightning-fast ASGI server for Python
version: "0.37.0"
tag: "0.37.0"
requires:
  - Python
  - gunicorn
  - click
  - h11
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