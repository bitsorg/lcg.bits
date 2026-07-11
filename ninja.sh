package: ninja
description: Ninja small build system with a focus on speed
version: "1.13.0"
tag: "1.13.0"
requires:
  - Python
prefer_system: ".*"
prefer_system_check: |
  type ninja

build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: Apache-2.0
---
#!/bin/bash -e
##############################
. $(bits-include PythonPipRecipe)
##############################
MODULE_OPTIONS="--bin --python"
##############################