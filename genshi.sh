package: genshi
description: Genshi Python toolkit for XML/HTML stream generation
version: "0.7.7"
tag: "0.7.7"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/Genshi-0.7.7.tar.gz
requires:
  - Python
  - setuptools
build_requires:
  - bits-recipe-tools
license: BSD-3-Clause
---
#!/bin/bash -e
##############################
. $(bits-include PythonRecipe)
##############################
MODULE_OPTIONS="--python"
##############################