package: memory_profiler
description: memory-profiler monitor memory usage of Python programs
version: "0.61.0"
tag: "0.61.0"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/memory_profiler-0.61.0.tar.gz
requires:
  - Python
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: BSD-3-Clause
---
#!/bin/bash -e
##############################
. $(bits-include PythonRecipe)
##############################
MODULE_OPTIONS="--bin --python"
##############################