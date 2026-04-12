package: dask_lxplus
description: dask_lxplus Python package
version: "0.3.3"
tag: "0.3.3"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/dask_lxplus-0.3.3.tar.gz
requires:
  - Python
  - setuptools
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
license: TODO
---
#!/bin/bash -e
##############################
. $(bits-include PythonRecipe)
##############################
MODULE_OPTIONS="--python"
##############################