package: pillow
description: Pillow the friendly PIL (Python Imaging Library) fork
version: "13.0.0"
tag: "13.0.0"
requires:
  - Python
  - freetype
  - zlib
  - libffi
  - cffi
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: HPND
---
#!/bin/bash -e
export CFLAGS="-I${ZLIB_ROOT}/include ${CFLAGS:-}"
export LDFLAGS="-L${ZLIB_ROOT}/lib ${LDFLAGS:-}"
##############################
. $(bits-include PythonPipRecipe)
##############################
MODULE_OPTIONS="--bin --python"
##############################
