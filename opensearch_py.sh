package: opensearch_py
description: opensearch-py official Python client for OpenSearch
version: "2.8.0"
tag: "2.8.0"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/opensearch_py-2.8.0.tar.gz
requires:
  - Python
  - setuptools
  - pip
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