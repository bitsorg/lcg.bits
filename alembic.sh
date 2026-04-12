package: alembic
description: alembic Python package
version: "1.16.5"
tag: "1.16.5"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/alembic-1.16.5.tar.gz
requires:
  - Python
  - pip
  - mako
  - sqlalchemy
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