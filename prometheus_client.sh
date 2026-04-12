package: prometheus_client
description: prometheus_client Python package
version: "0.21.1"
tag: "0.21.1"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/prometheus_client-0.21.1.tar.gz
requires:
  - Python
  - setuptools
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