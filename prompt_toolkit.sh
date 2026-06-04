package: prompt_toolkit
description: prompt_toolkit library for interactive command-line programs
version: "3.0.47"
tag: "3.0.47"
requires:
  - Python
  - six
  - wcwidth
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