package: kubernetes
description: Official Python client library for Kubernetes
version: "35.0.0"
tag: "35.0.0"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/kubernetes-35.0.0.tar.gz
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