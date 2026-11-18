package: odfpy
description: odfpy Python API for OpenDocument Format (ODF)
version: "1.4.1"
tag: "1.4.1"
requires:
  - Python
  - defusedxml
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: Apache-2.0 OR GPL-2.0-or-later
---
#!/bin/bash -e
##############################
. $(bits-include PythonPipRecipe)
##############################
MODULE_OPTIONS="--bin --python"
##############################