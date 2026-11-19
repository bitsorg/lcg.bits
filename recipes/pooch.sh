package: pooch
description: Pooch manage downloading and caching data files
version: "1.6.0"
tag: "1.6.0"
requires:
  - Python
  - setuptools_scm
  - appdirs
  - packaging
  - requests
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