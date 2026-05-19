package: pykube_ng
description: pykube-ng lightweight Kubernetes Python client
version: "23.6.0"
tag: "23.6.0"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/pykube_ng-23.6.0.tar.gz
requires:
  - Python
  - PyYAML
  - requests
  - urllib3
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