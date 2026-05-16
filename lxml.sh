package: lxml
description: lxml powerful and fast XML and HTML processing library
version: "5.3.1"
tag: "5.3.1"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/lxml-5.3.1.tar.gz
requires:
  - Python
  - setuptools
  - libxml2
  - libxslt
  - cython
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