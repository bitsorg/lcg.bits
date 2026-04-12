package: pystan
description: pystan Python package
version: "3.10.0"
tag: "3.10.0"
requires:
  - Python
  - setuptools
  - pip
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
license: TODO
---
#!/bin/bash -e
##############################
. $(bits-include PythonRecipe)
##############################
MODULE_OPTIONS="--python"
##############################