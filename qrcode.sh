package: qrcode
description: qrcode QR code generator for Python
version: "7.4.2"
tag: "7.4.2"
requires:
  - Python
  - pypng
  - typing_extensions
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