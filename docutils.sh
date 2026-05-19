package: docutils
description: Docutils Python documentation utilities and reStructuredText
version: "0.21.2"
tag: "0.21.2"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/docutils-0.21.2.tar.gz
requires:
  - Python
  - pip
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: BSD-3-Clause AND GPL-3.0-or-later
---
#!/bin/bash -e
##############################
. $(bits-include PythonRecipe)
##############################
MODULE_OPTIONS="--bin --python"
##############################