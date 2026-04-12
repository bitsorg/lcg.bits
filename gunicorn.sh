package: gunicorn
description: gunicorn Python package
version: "23.0.0"
tag: "23.0.0"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/gunicorn-23.0.0.tar.gz
requires:
  - Python
  - pip
  - packaging
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