package: pint
description: Pint Python units library for quantities
version: "0.25.2"
tag: "0.25.2"
requires:
  - Python
  - flexcache
  - flexparser
  - platformdirs
  - typing_extensions
  - numpy
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