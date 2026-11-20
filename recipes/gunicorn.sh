package: gunicorn
description: Gunicorn Python WSGI HTTP Server for UNIX
version: "23.0.0"
tag: "23.0.0"
requires:
  - Python
  - packaging
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