package: gunicorn
description: Gunicorn Python WSGI HTTP Server for UNIX
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
license: MIT
---
#!/bin/bash -e
##############################
. $(bits-include PythonRecipe)
##############################
MODULE_OPTIONS="--python"
##############################