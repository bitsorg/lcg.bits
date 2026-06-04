package: kubernetes
description: Official Python client library for Kubernetes
version: "35.0.0"
tag: "35.0.0"
requires:
  - Python
  - certifi
  - six
  - python_dateutil
  - PyYAML
  - websocket_client
  - requests
  - requests_oauthlib
  - urllib3
  - durationpy
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