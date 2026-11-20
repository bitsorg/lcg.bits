package: isodate
description: isodate ISO 8601 date/time/duration parser and formatter
version: "0.7.2"
tag: "0.7.2"
requires:
  - Python
  - six
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