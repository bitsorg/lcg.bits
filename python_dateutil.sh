package: python_dateutil
description: python_dateutil Python package
version: "2.9.0.post0"
tag: "2.9.0.post0"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/python-dateutil-2.9.0.post0.tar.gz
requires:
  - Python
  - setuptools
  - six
  - setuptools_scm
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