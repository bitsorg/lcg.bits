package: openapi_schema_validator
description: openapi_schema_validator Python package
version: "0.6.3"
tag: "0.6.3"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/openapi_schema_validator-0.6.3.tar.gz
requires:
  - Python
  - pip
  - jsonschema
  - jsonschema_specifications
  - rfc3339_validator
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