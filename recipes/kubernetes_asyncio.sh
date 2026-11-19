package: kubernetes_asyncio
description: kubernetes_asyncio async Kubernetes Python client
version: "21.7.1"
tag: "21.7.1"
requires:
  - Python
  - PyYAML
  - certifi
  - six
  - python_dateutil
  - urllib3
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