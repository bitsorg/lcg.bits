package: ruamel_yaml_clib
description: ruamel.yaml.clib C extension speedups for ruamel.yaml
version: "0.2.15"
tag: "0.2.15"
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