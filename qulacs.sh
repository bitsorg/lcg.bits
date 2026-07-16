package: qulacs
description: Qulacs fast quantum circuit simulator for Python
version: "0.6.4.1"
source: https://github.com/qulacs/qulacs
tag: "v%(version)s"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/%(name)s-%(version)s.tar.gz
requires:
  - Python
  - Boost
  - scipy
  - numpy
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: MIT
patches:
  - qulacs-0.6.4.1.patch
---
#!/bin/bash -e
##############################
. $(bits-include PythonRecipe)
##############################
MODULE_OPTIONS="--bin --python"
##############################