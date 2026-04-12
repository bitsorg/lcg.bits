package: pyroscope_io
description: pyroscope_io Python package
version: "0.8.5"
tag: "0.8.5"
requires:
  - Python
  - pip
  - cffi
build_requires:
  - bits-recipe-tools
license: TODO
---
#!/bin/bash -e
##############################
. $(bits-include PythonRecipe)
##############################
MODULE_OPTIONS="--python"
##############################