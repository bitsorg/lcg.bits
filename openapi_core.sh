package: openapi_core
description: openapi-core OpenAPI spec validation and parsing
version: "0.19.4"
tag: "0.19.4"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/openapi_core-0.19.4.tar.gz
requires:
  - Python
  - pip
  - jsonschema_path
  - jsonschema
  - more_itertools
  - openapi_schema_validator
  - openapi_spec_validator
  - parse
  - werkzeug
  - isodate
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: BSD-3-Clause
---
#!/bin/bash -e
##############################
. $(bits-include PythonRecipe)
##############################
MODULE_OPTIONS="--bin --python"
##############################