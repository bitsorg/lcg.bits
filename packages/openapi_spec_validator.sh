package: openapi_spec_validator
description: openapi-spec-validator OpenAPI spec structural validation
version: "0.7.1"
tag: "0.7.1"
requires:
  - Python
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
. $(bits-include PythonPipRecipe)
##############################
MODULE_OPTIONS="--bin --python"
##############################