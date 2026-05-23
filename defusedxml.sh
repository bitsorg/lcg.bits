package: defusedxml
description: defusedxml safe XML parsing (defense against XXE)
version: "0.7.1"
tag: "0.7.1"
requires:
  - Python
  - libxml2
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: PSFL
---
#!/bin/bash -e
##############################
. $(bits-include PythonPipRecipe)
##############################
MODULE_OPTIONS="--bin --python"
##############################