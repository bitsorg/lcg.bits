package: jsonschema_path
description: jsonschema-path path-based JSON Schema traversal
version: "0.3.3"
tag: "0.3.3"
requires:
  - Python
  - pathable
  - PyYAML
  - referencing
  - requests
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