package: sqlalchemy
description: sqlalchemy Python package
version: "2.0.48"
tag: "2.0.48"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/SQLAlchemy-2.0.48.tar.gz
requires:
  - Python
  - pip
  - typing_extensions
  - greenlet
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