package: aiohttp
description: aiohttp Python package
version: "3.11.11"
tag: "3.11.11"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/aiohttp-3.11.11.tar.gz
requires:
  - Python
  - setuptools
  - aiosignal
  - async_timeout
  - frozenlist
  - multidict
  - yarl
  - attrs
  - charset_normalizer
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