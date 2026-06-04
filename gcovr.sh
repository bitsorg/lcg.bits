package: gcovr
description: gcovr Gcov coverage reports generator
version: "7.2"
tag: "7.2"
requires:
  - Python
  - lxml
  - Jinja2
  - pygments
  - colorlog
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