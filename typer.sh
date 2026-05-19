package: typer
description: Typer CLI framework based on Python type hints
version: "0.15.1"
tag: "0.15.1"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/typer-0.15.1.tar.gz
requires:
  - Python
  - click
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