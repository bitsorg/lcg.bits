package: pycountry
description: pycountry ISO databases for countries, languages, currencies
version: "24.6.1"
tag: "24.6.1"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/pycountry-24.6.1.tar.gz
requires:
  - Python
  - pip
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: LGPL-2.1-or-later
---
#!/bin/bash -e
##############################
. $(bits-include PythonRecipe)
##############################
MODULE_OPTIONS="--bin --python"
##############################