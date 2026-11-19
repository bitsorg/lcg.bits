package: alembic
description: Alembic database schema migration tool for SQLAlchemy
version: "1.16.5"
tag: "1.16.5"
requires:
  - Python
  - mako
  - sqlalchemy
  - typing_extensions
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