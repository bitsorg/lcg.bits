package: pint
description: Pint Python units library for quantities
version: "0.25.2"
tag: "0.25.2"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/pint-0.25.2.tar.gz
requires:
  - Python
  - flexcache
  - flexparser
  - platformdirs
  - typing_extensions
  - numpy
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: BSD-3-Clause
---
#!/bin/bash -e
##############################
. $(bits-include PythonRecipe)
##############################
MODULE_OPTIONS="--bin --python"
##############################