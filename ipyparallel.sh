package: ipyparallel
description: ipyparallel interactive parallel computing with Jupyter
version: "9.0.0"
tag: "9.0.0"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/ipyparallel-9.0.0.tar.gz
requires:
  - ipython_genutils
  - decorator
  - pyzmq
  - traitlets
  - ipython
  - jupyter_client
  - ipykernel
  - tornado
  - python_dateutil
  - notebook
  - joblib
build_requires:
  - bits-recipe-tools
license: BSD-3-Clause
patches:
  - ipyparallel-9.0.0.patch
---
#!/bin/bash -e
##############################
. $(bits-include PythonRecipe)
##############################
MODULE_OPTIONS="--python"
##############################