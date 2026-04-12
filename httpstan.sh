package: httpstan
description: httpstan Python package
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
license: TODO
---
#!/bin/bash -e
##############################
. $(bits-include PythonRecipe)
##############################
MODULE_OPTIONS="--python"
##############################