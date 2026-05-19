package: pillow
description: Pillow the friendly PIL (Python Imaging Library) fork
version: "11.2.1"
tag: "11.2.1"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/Pillow-11.2.1.tar.gz
requires:
  - Python
  - freetype
  - zlib
  - libffi
  - cffi
  - pip
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: HPND
---
#!/bin/bash -e
export CFLAGS="-I${ZLIB_ROOT}/include ${CFLAGS:-}"
export LDFLAGS="-L${ZLIB_ROOT}/lib ${LDFLAGS:-}"
##############################
. $(bits-include PythonRecipe)
##############################
MODULE_OPTIONS="--bin --python"
##############################