package: opensearch_py
description: opensearch-py official Python client for OpenSearch
version: "2.8.0"
tag: "2.8.0"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/%(name)s-%(version)s.tar.gz
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
. $(bits-include PythonRecipe)
##############################
MODULE_OPTIONS="--bin --python"
##############################