package: hepdata_validator
description: hepdata_validator Python package
version: "0.3.6"
tag: "0.3.6"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/hepdata-validator-0.3.6.tar.gz
requires:
  - Python
  - setuptools
  - jsonschema
  - PyYAML
  - requests
  - click
  - packaging
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