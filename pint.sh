package: pint
description: pint Python package
version: "0.25.2"
tag: "0.25.2"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/pint-0.25.2.tar.gz
requires:
  - Python
  - setuptools
  - flexcache
  - flexparser
  - platformdirs
  - typing_extensions
  - numpy
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