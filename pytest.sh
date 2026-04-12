package: pytest
description: pytest Python package
version: "9.0.2"
tag: "9.0.2"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/pytest-9.0.2.tar.gz
requires:
  - Python
  - setuptools
  - py
  - funcsigs
  - six
  - attrs
  - pluggy
  - more_itertools
  - atomicwrites
  - packaging
  - iniconfig
  - pip
  - pygments
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