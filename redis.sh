package: redis
description: redis-py Python client for Redis
version: "4.3.3"
tag: "4.3.3"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/redis-4.3.3.tar.gz
requires:
  - Python
  - setuptools
  - async_timeout
  - deprecated
  - packaging
  - pip
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: MIT
---
#!/bin/bash -e
##############################
. $(bits-include PythonRecipe)
##############################
MODULE_OPTIONS="--bin --python"
##############################