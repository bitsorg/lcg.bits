package: openapi_schema_pydantic
description: openapi-schema-pydantic Pydantic models for OpenAPI 3.0
version: "unknown"
tag: "unknown"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/openapi-schema-pydantic-unknown.tar.gz
requires:
  - Python
  - pip
  - pydantic
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