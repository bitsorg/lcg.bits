package: dask_lxplus
description: dask-lxplus Dask helper for CERN lxplus batch
version: "0.3.3"
tag: "0.3.3"
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
. $(bits-include PythonPipRecipe)
##############################
MODULE_OPTIONS="--bin --python"
##############################