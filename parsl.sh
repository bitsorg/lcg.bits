package: parsl
description: parsl Python package
version: "1.2.0"
tag: "1.2.0"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/parsl-1.2.0.tar.gz
requires:
  - typeguard
  - ipyparallel
  - globus_sdk
  - dill
  - tblib
  - ipykernel
  - requests
  - paramiko
  - psutil
  - mpi4py
  - typing_extensions
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