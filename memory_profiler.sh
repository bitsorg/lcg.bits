package: memory_profiler
description: memory_profiler Python package
version: "0.61.0"
tag: "0.61.0"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/memory_profiler-0.61.0.tar.gz
requires:
  - Python
  - pip
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