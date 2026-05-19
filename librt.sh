package: librt
description: POSIX realtime extensions library (part of glibc)
version: "0.7.8"
tag: "0.7.8"
sources:
  - https://files.pythonhosted.org/packages/e7/24/5f3646ff414285e0f7708fa4e946b9bf538345a41d1c375c439467721a5e/librt-0.7.8.tar.gz
requires:
  - Python
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: LGPL-2.1-only
---
#!/bin/bash -e
##############################
. $(bits-include PythonRecipe)
##############################
MODULE_OPTIONS="--bin --python"
##############################