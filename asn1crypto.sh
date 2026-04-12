package: asn1crypto
description: asn1crypto Python package
version: "0.24.0"
tag: "0.24.0"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/asn1crypto-0.24.0.tar.gz
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