package: lxml
description: lxml powerful and fast XML and HTML processing library
version: "5.3.1"
source: https://github.com/lxml/lxml
tag: "lxml-%(version)s"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/%(name)s-%(version)s.tar.gz
requires:
  - Python
  - libxml2
  - libxslt
  - cython
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: BSD-3-Clause
---
#!/bin/bash -e
export RUN_TESTS=false
##############################
. $(bits-include PythonRecipe)
##############################
MODULE_OPTIONS="--bin --python"
##############################