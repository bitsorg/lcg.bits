package: redis
description: redis-py Python client for Redis
version: "4.4.4"
tag: "4.4.4"
requires:
  - Python
  - async_timeout
  - deprecated
  - packaging
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