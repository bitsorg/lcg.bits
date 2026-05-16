package: ccorp_yaml_include_relative_path
description: PyYAML plugin for YAML !include with relative paths
version: "0.0.4"
tag: "0.0.4"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/ccorp-yaml-include-relative-path-0.0.4.tar.gz
requires:
  - Python
  - pip
build_requires:
  - bits-recipe-tools
license: MIT
---
#!/bin/bash -e
##############################
. $(bits-include PythonRecipe)
##############################
MODULE_OPTIONS="--python"
##############################