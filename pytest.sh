package: pytest
description: pytest simple and powerful Python testing framework
version: "9.0.2"
tag: "9.0.2"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/pytest-9.0.2.tar.gz
requires:
  - Python
  - py
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
  - "GCC-Toolchain:(?!osx)"
license: MIT
---
#!/bin/bash -e
##############################
. $(bits-include PythonRecipe)
##############################
MODULE_OPTIONS="--bin --python"
##############################