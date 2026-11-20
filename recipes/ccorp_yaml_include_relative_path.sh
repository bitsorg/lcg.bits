package: ccorp_yaml_include_relative_path
description: PyYAML plugin for YAML !include with relative paths
version: "0.0.4"
tag: "0.0.4"
requires:
  - Python
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: MIT
---
#!/bin/bash -e
##############################
. $(bits-include PythonPipRecipe)
##############################
MODULE_OPTIONS="--bin --python"
##############################