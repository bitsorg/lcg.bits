package: clikit
description: clikit Python package
version: "0.6.2"
tag: "0.6.2"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/clikit-0.6.2.tar.gz
requires:
  - Python
  - setuptools
  - crashtest
  - pastel
  - pylev
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