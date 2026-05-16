package: hepunits
description: hepunits physical units and constants for Python (HEP)
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
license: LGPL-3.0-or-later
---
#!/bin/bash -e
##############################
. $(bits-include PythonRecipe)
##############################
MODULE_OPTIONS="--python"
##############################