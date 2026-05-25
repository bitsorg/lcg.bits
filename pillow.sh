package: pillow
description: Pillow the friendly PIL (Python Imaging Library) fork
version: "12.2.0"
tag: "12.2.0"
#sources:
#  - https://lcgpackages.web.cern.ch/tarFiles/sources/Pillow-11.2.1.tar.gz
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
