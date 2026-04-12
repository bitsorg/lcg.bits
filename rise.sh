package: rise
description: rise Python package
version: "5.7.2.2"
tag: "5.7.2.2"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/rise-5.7.2.2.tar.gz
requires:
  - Python
  - setuptools
  - notebook
  - jupyter_core
  - ipython_genutils
  - traitlets
  - decorator
  - tornado
  - beautifulsoup4
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