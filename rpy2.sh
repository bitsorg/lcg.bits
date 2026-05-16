package: rpy2
description: rpy2 Python interface to R language
version: "3.0.4"
tag: "3.0.4"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/rpy2-3.0.4.tar.gz
requires:
  - Python
  - setuptools
  - R
  - singledispatch
  - xz
  - pcre
  - tzlocal
  - cffi
build_requires:
  - bits-recipe-tools
license: GPL-2.0-or-later
---
#!/bin/bash -e
##############################
. $(bits-include PythonRecipe)
##############################
MODULE_OPTIONS="--python"
##############################