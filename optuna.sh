package: optuna
description: Optuna hyperparameter optimization framework
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
  - "GCC-Toolchain:(?!osx)"
license: MIT
---
#!/bin/bash -e
##############################
. $(bits-include PythonRecipe)
##############################
MODULE_OPTIONS="--bin --python"
##############################