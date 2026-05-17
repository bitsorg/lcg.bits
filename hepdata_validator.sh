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
  - pip
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: MIT
---
#!/bin/bash -e
##############################
. $(bits-include PythonRecipe)
##############################
MODULE_OPTIONS="--bin --python"
##############################