package: ruamel_yaml
description: ruamel.yaml YAML parser/emitter with roundtrip preservation
version: "0.18.10"
tag: "0.18.10"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/ruamel.yaml-0.18.10.tar.gz
requires:
  - Python
  - ruamel_yaml_clib
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