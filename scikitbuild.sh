package: scikitbuild
description: scikit-build improved build system generator for CPython
version: "0.18.1"
tag: "0.18.1"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/scikit-build-0.18.1.tar.gz
requires:
  - Python
  - setuptools
  - wheel
  - packaging
  - distro
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