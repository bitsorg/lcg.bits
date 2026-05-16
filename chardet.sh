package: chardet
description: Chardet universal encoding detector for Python
version: "5.2.0"
tag: "5.2.0"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/chardet-5.2.0.tar.gz
requires:
  - Python
  - setuptools
build_requires:
  - bits-recipe-tools
license: LGPL-2.1-or-later
---
#!/bin/bash -e
##############################
. $(bits-include PythonRecipe)
##############################
MODULE_OPTIONS="--python"
##############################