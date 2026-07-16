package: ipyparallel
description: ipyparallel interactive parallel computing with Jupyter
version: "9.0.0"
source: https://github.com/ipython/ipyparallel
tag: "v%(version)s"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/%(name)s-%(version)s.tar.gz
requires:
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
  - "GCC-Toolchain:(?!osx)"
license: BSD-3-Clause
patches:
  - ipyparallel-9.0.0.patch
---
#!/bin/bash -e
##############################
. $(bits-include PythonRecipe)
##############################
MODULE_OPTIONS="--bin --python"
##############################