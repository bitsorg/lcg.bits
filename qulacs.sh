package: qulacs
description: Qulacs fast quantum circuit simulator for Python
version: "0.6.4.1"
tag: "0.6.4.1"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/qulacs-0.6.4.1.tar.gz
requires:
  - Python
  - pip
  - Boost
  - scipy
  - numpy
build_requires:
  - bits-recipe-tools
license: MIT
patches:
  - qulacs-0.6.4.1.patch
---
#!/bin/bash -e
##############################
. $(bits-include PythonRecipe)
##############################
MODULE_OPTIONS="--python"
##############################