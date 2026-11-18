package: optuna
description: Optuna hyperparameter optimization framework
version: "4.4.0"
tag: "4.4.0"
requires:
  - Python
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
. $(bits-include PythonPipRecipe)
##############################
MODULE_OPTIONS="--bin --python"
##############################