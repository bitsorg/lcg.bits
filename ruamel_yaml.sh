package: ruamel_yaml
description: ruamel.yaml YAML parser/emitter with roundtrip preservation
version: "0.18.10"
tag: "0.18.10"
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
. $(bits-include PythonPipRecipe)
##############################
MODULE_OPTIONS="--bin --python"
##############################