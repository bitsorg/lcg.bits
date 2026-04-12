package: python_gitlab
description: python_gitlab Python package
version: "1.8.0"
tag: "1.8.0"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/python-gitlab-1.8.0.tar.gz
requires:
  - Python
  - setuptools
  - six
  - requests
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