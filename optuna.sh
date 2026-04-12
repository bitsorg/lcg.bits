package: optuna
description: optuna Python package
version: "4.4.0"
tag: "4.4.0"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/optuna-4.4.0.tar.gz
requires:
  - Python
  - pip
  - alembic
  - colorlog
  - numpy
  - packaging
  - PyYAML
  - sqlalchemy
  - tqdm
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