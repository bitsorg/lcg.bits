package: opensearch_py
description: opensearch-py official Python client for OpenSearch
version: "2.8.0"
tag: "2.8.0"
requires:
  - Python
  - python_dateutil
  - six
  - requests
  - certifi
  - aiohttp
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