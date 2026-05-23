package: sqlalchemy
description: SQLAlchemy SQL toolkit and object-relational mapper
version: "2.0.48"
tag: "2.0.48"
requires:
  - Python
  - typing_extensions
  - greenlet
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