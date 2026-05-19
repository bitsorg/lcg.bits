package: pycairo
description: Pycairo Python bindings for the Cairo library
version: "1.28.0"
tag: "1.28.0"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/pycairo-1.28.0.tar.gz
requires:
  - Python
  - cairo
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: LGPL-2.1-only OR MPL-1.1
---
#!/bin/bash -e
export PKG_CONFIG_PATH="/usr/share/pkgconfig:${PKG_CONFIG_PATH:-}"
[ "$(uname -s)" = "Darwin" ] && export CPPFLAGS="-I/opt/X11/include ${CPPFLAGS:-}"
##############################
. $(bits-include PythonRecipe)
##############################
MODULE_OPTIONS="--bin --python"
##############################