package: openapi_spec_validator
description: openapi-spec-validator OpenAPI spec structural validation
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
  - "GCC-Toolchain:(?!osx)"
license: Apache-2.0
---
#!/bin/bash -e
##############################
. $(bits-include PythonRecipe)
##############################
MODULE_OPTIONS="--bin --python"
##############################