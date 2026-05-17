package: elasticsearch
description: Elasticsearch official Python client
version: "6.3.0"
tag: "6.3.0"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/elasticsearch-6.3.0.tar.gz
requires:
  - Python
  - setuptools
  - urllib3
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