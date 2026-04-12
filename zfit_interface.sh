package: zfit_interface
description: zfit_interface Python package
version: "0.0.3"
tag: "0.0.3"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/zfit_interface-0.0.3.tar.gz
requires:
  - Python
  - pip
  - uhi
  - numpy
  - typing_extensions
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