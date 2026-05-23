package: redis
description: redis-py Python client for Redis
version: "4.3.3"
tag: "4.3.3"
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