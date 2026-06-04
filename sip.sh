package: sip
description: SIP tool for creating Python bindings for C/C++ libraries
version: "6.8.3"
tag: "6.8.3"
requires:
  - Python
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: GPL-3.0-only OR LGPL-3.0-only
---
#!/bin/bash -e
##############################
. $(bits-include PythonPipRecipe)
##############################
MODULE_OPTIONS="--bin --python"
##############################