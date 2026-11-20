package: hepdata_validator
description: hepdata-validator HEPData submission YAML schema validator
version: "0.3.6"
tag: "0.3.6"
requires:
  - Python
  - jsonschema
  - PyYAML
  - requests
  - click
  - packaging
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