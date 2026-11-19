package: aiohttp
description: aiohttp async HTTP client/server framework for asyncio
version: "3.14.4"
tag: "3.14.4"
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
. $(bits-include PythonPipRecipe)
##############################
MODULE_OPTIONS="--bin --python"
##############################