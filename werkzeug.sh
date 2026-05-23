package: werkzeug
description: Werkzeug WSGI web application library for Python
version: "3.1.3"
tag: "3.1.3"
requires:
  - Python
  - MarkupSafe
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