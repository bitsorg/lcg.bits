package: traitlets
description: traitlets Python package
version: "5.14.3"
tag: "5.14.3"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/traitlets-5.14.3.tar.gz
requires:
  - Python
  - pip
  - setuptools
  - ipython_genutils
  - six
  - decorator
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