package: elasticsearch
description: elasticsearch Python package
version: "6.3.0"
tag: "6.3.0"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/elasticsearch-6.3.0.tar.gz
requires:
  - Python
  - setuptools
  - urllib3
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