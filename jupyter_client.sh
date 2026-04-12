package: jupyter_client
description: jupyter_client Python package
version: "7.4.9"
tag: "7.4.9"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/jupyter_client-7.4.9.tar.gz
requires:
  - Python
  - setuptools
  - jupyter_core
  - traitlets
  - pyzmq
  - python_dateutil
  - tornado
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