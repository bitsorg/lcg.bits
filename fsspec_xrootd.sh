package: fsspec_xrootd
description: fsspec-xrootd XRootD filesystem interface for fsspec
version: "0.5.5"
tag: "0.5.5"
requires:
  - Python
  - fsspec
  - xrootd
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