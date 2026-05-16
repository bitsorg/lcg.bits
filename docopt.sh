package: docopt
description: docopt Pythonic command-line argument parser
version: "0.6.2"
tag: "0.6.2"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/docopt-0.6.2.tar.gz
requires:
  - Python
  - setuptools
build_requires:
  - bits-recipe-tools
license: MIT
---
#!/bin/bash -e
##############################
. $(bits-include PythonRecipe)
##############################
MODULE_OPTIONS="--python"
##############################