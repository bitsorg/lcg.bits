package: dask_jobqueue
description: dask-jobqueue deploy Dask on HPC job schedulers
version: "0.9.0"
tag: "0.9.0"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/dask-jobqueue-0.9.0.tar.gz
requires:
  - Python
  - setuptools
  - dask
  - distributed
build_requires:
  - bits-recipe-tools
license: BSD-3-Clause
---
#!/bin/bash -e
##############################
. $(bits-include PythonRecipe)
##############################
MODULE_OPTIONS="--python"
##############################