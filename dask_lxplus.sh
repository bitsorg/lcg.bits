package: dask_lxplus
description: dask-lxplus Dask helper for CERN lxplus batch
version: "0.3.3"
tag: "0.3.3"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/dask_lxplus-0.3.3.tar.gz
requires:
  - Python
  - click
  - cryptography
  - dask
  - dask_jobqueue
  - psutil
  - PyYAML
  - humanize
  - click_didyoumean
  - watchdog
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: BSD-3-Clause
---
#!/bin/bash -e
##############################
. $(bits-include PythonRecipe)
##############################
MODULE_OPTIONS="--bin --python"
##############################