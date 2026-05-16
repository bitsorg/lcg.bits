package: hepdata_validator
description: hepdata-validator HEPData submission YAML schema validator
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
license: MIT
---
#!/bin/bash -e
##############################
. $(bits-include PythonRecipe)
##############################
MODULE_OPTIONS="--python"
##############################