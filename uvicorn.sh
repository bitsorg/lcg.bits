package: uvicorn
description: uvicorn Python package
version: "0.37.0"
tag: "0.37.0"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/uvicorn-0.37.0.tar.gz
requires:
  - Python
  - pip
  - gunicorn
  - click
  - h11
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