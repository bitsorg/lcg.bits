package: polars
description: polars Python package
version: "0.18.13"
tag: "0.18.13"
requires:
  - Python
  - setuptools
  - pip
  - wheel
  - jemalloc
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