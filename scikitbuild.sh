package: scikitbuild
description: scikit-build improved build system generator for CPython
version: "0.18.1"
source: https://github.com/scikit-build/scikit-build
tag: "v%(version)s"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/scikit-build-0.18.1.tar.gz
requires:
  - Python
  - wheel
  - packaging
  - distro
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