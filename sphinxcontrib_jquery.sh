package: sphinxcontrib_jquery
description: sphinxcontrib-jquery jQuery for Sphinx HTML themes
version: "4.1"
tag: "4.1"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/sphinxcontrib_jquery-4.1.tar.gz
requires:
  - Python
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: BSD-2-Clause
---
#!/bin/bash -e
##############################
. $(bits-include PythonRecipe)
##############################
MODULE_OPTIONS="--bin --python"
##############################