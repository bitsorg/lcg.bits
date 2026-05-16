package: meson
description: Meson fast and user-friendly software build system
version: "1.11.1"
tag: "1.11.1"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/meson-1.11.1.tar.gz
requires:
  - Python
  - pip
build_requires:
  - bits-recipe-tools
license: Apache-2.0
---
#!/bin/bash -e
##############################
. $(bits-include PythonRecipe)
##############################
MODULE_OPTIONS="--python"
##############################