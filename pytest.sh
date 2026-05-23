package: pytest
description: pytest simple and powerful Python testing framework
version: "9.0.2"
tag: "9.0.2"
requires:
  - Python
  - py
  - six
  - attrs
  - pluggy
  - more_itertools
  - atomicwrites
  - packaging
  - iniconfig
  - pygments
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