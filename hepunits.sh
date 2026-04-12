package: hepunits
description: hepunits Python package
version: "2.4.3"
tag: "2.4.3"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/hepunits-2.4.3.tar.gz
requires:
  - Python
  - setuptools
  - attrs
  - pip
  - pint
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