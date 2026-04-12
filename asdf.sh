package: asdf
description: asdf Python package
version: "3.5.0"
tag: "3.5.0"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/asdf-3.5.0.tar.gz
requires:
  - Python
  - pip
  - asdf_standard
  - asdf_transform_schemas
  - semantic_version
  - jmespath
  - attrs
  - importlib_metadata
  - numpy
  - packaging
  - PyYAML
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