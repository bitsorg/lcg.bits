package: distributed
description: Distributed Dask's distributed task scheduler
version: "2025.2.0"
tag: "2025.2.0"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/distributed-2025.2.0.tar.gz
requires:
  - Python
  - pip
  - PyYAML
  - six
  - cloudpickle
  - tblib
  - tornado
  - psutil
  - zict
  - sortedcontainers
  - toolz
  - msgpack
  - dask
  - click
  - Jinja2
  - bokeh
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