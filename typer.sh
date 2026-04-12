package: typer
description: typer Python package
version: "0.15.1"
tag: "0.15.1"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/typer-0.15.1.tar.gz
requires:
  - Python
  - pip
  - click
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