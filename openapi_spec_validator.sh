package: openapi_spec_validator
description: openapi_spec_validator Python package
version: "0.7.1"
tag: "0.7.1"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/openapi_spec_validator-0.7.1.tar.gz
requires:
  - Python
  - pip
  - jsonschema
  - jsonschema_path
  - lazy_object_proxy
  - openapi_schema_validator
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