package: aiohttp
description: aiohttp async HTTP client/server framework for asyncio
version: "3.11.11"
tag: "3.11.11"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/%(name)s-%(version)s.tar.gz
requires:
  - Python
  - aiosignal
  - async_timeout
  - frozenlist
  - multidict
  - yarl
  - attrs
  - charset_normalizer
  - aiohappyeyeballs
  - propcache
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: Apache-2.0
---
#!/bin/bash -e
##############################
. $(bits-include PythonRecipe)
##############################
MODULE_OPTIONS="--bin --python"
##############################