package: httpstan
description: httpstan HTTP-based interface to Stan statistical models
version: "4.13.0"
tag: "4.13.0"
requires:
  - Python
  - setuptools
  - pip
  - wheel
  - marshmallow
  - webargs
  - numpy
  - aiohttp
  - appdirs
  - py_lz4
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: ISC
---
#!/bin/bash -e
##############################
. $(bits-include PythonRecipe)
##############################
MODULE_OPTIONS="--bin --python"
##############################