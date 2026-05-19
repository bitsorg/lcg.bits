package: kubernetes_asyncio
description: kubernetes_asyncio async Kubernetes Python client
version: "21.7.1"
tag: "21.7.1"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/kubernetes_asyncio-21.7.1.tar.gz
requires:
  - Python
  - PyYAML
  - certifi
  - six
  - python_dateutil
  - urllib3
  - aiohttp
  - pip
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