package: kr8s
description: kr8s simple Kubernetes Python client
version: "0.20.14"
tag: "0.20.14"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/%(name)s-%(version)s.tar.gz
requires:
  - Python
  - aiohttp
  - anyio
  - python_box
  - httpx
  - python_jsonpath
  - PyYAML
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: BSD-3-Clause
---
#!/bin/bash -e
##############################
. $(bits-include PythonRecipe)
##############################
MODULE_OPTIONS="--bin --python"
##############################