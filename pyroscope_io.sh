package: pyroscope_io
description: pyroscope-io Python client for Pyroscope profiler
version: "0.8.5"
tag: "0.8.5"
requires:
  - Python
  - pip
  - cffi
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: Apache-2.0
---
#!/bin/bash -e
##############################
. $(bits-include PythonRecipe)
##############################
MODULE_OPTIONS="--bin --python"
##############################