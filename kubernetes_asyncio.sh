package: kubernetes_asyncio
description: kubernetes_asyncio Python package
version: "21.7.1"
tag: "21.7.1"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/kubernetes_asyncio-21.7.1.tar.gz
requires:
  - Python
  - setuptools
  - PyYAML
  - certifi
  - six
  - python_dateutil
  - urllib3
  - aiohttp
build_requires:
  - bits-recipe-tools
license: TODO
---
#!/bin/bash -e
##############################
. $(bits-include PythonRecipe)
##############################
MODULE_OPTIONS="--python"
##############################