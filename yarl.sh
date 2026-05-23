package: yarl
description: yarl yet another URL library for Python
version: "1.18.3"
tag: "1.18.3"
requires:
  - Python
  - idna
  - multidict
  - propcache
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