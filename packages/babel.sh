package: babel
description: Babel internationalisation tools for Python
version: "2.17.0"
tag: "2.17.0"
requires:
  - Python
  - pytz
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