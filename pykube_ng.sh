package: pykube_ng
description: pykube-ng lightweight Kubernetes Python client
version: "23.6.0"
tag: "23.6.0"
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
. $(bits-include PythonPipRecipe)
##############################
MODULE_OPTIONS="--bin --python"
##############################