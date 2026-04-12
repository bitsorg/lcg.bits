package: pydantic_core
description: pydantic_core Python package
version: "2.41.5"
tag: "2.41.5"
requires:
  - Python
  - pip
  - typing_extensions
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