package: openapi_schema_pydantic
description: openapi_schema_pydantic Python package
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
license: TODO
---
#!/bin/bash -e
##############################
. $(bits-include PythonRecipe)
##############################
MODULE_OPTIONS="--python"
##############################