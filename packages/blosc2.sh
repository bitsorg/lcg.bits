package: blosc2
description: Python-Blosc2 next-gen Python bindings for C-Blosc2
version: "2.7.1"
tag: "2.7.1"
requires:
  - Python
  - wheel
  - scikitbuild
  - CMake
  - ninja
  - numpy
  - pycpuinfo
  - ndindex
  - msgpack
  - numexpr
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