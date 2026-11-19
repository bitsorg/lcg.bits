package: typing_inspection
description: typing-inspection Python typing inspection utilities
version: "0.4.2"
tag: "0.4.2"
requires:
  - Python
  - typing_extensions
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: MIT
---
#!/bin/bash -e
##############################
. $(bits-include PythonPipRecipe)
##############################
MODULE_OPTIONS="--bin --python"
##############################