package: rich_argparse
description: rich_argparse Python package
version: "1.6.0"
tag: "1.6.0"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/rich_argparse-1.6.0.tar.gz
requires:
  - Python
  - pip
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