package: openapi_schema_validator
description: openapi-schema-validator OpenAPI schema validation
version: "0.6.3"
tag: "0.6.3"
requires:
  - Python
  - jsonschema
  - jsonschema_specifications
  - rfc3339_validator
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: BSD-3-Clause
---
#!/bin/bash -e
##############################
. $(bits-include PythonPipRecipe)
##############################
MODULE_OPTIONS="--bin --python"
##############################