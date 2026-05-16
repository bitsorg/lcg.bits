package: webcolors
description: webcolors work with color names and values in HTML/CSS
version: "24.11.1"
tag: "24.11.1"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/webcolors-24.11.1.tar.gz
requires:
  - Python
  - pip
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