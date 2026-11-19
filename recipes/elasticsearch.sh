package: elasticsearch
description: Elasticsearch official Python client
version: "6.3.0"
tag: "6.3.0"
requires:
  - Python
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