package: click_didyoumean
description: click_didyoumean Python package
version: "0.3.0"
tag: "0.3.0"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/click-didyoumean-0.3.0.tar.gz
requires:
  - Python
  - setuptools
  - click
build_requires:
  - bits-recipe-tools
license: TODO
---
#!/bin/bash -e
##############################
. $(bits-include PythonRecipe)
##############################
MODULE_OPTIONS="--python"
##############################