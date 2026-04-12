package: jupyterlab_server
description: jupyterlab_server Python package
version: "2.27.3"
tag: "2.27.3"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/jupyterlab_server-2.27.3.tar.gz
requires:
  - jupyter_server
  - pyjson5
  - babel
  - jsonschema
  - packaging
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