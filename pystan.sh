package: pystan
description: PyStan Python interface to the Stan probabilistic language
version: "3.10.0"
tag: "3.10.0"
requires:
  - Python
  - wheel
  - numpy
  - cython
  - attrs
  - charset_normalizer
  - appdirs
  - idna
  - pyparsing
  - aiohttp
  - clikit
  - httpstan
  - pysimdjson
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