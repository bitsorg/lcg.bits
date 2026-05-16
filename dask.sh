package: dask
description: Dask parallel computing library for Python
version: "2025.2.0"
tag: "2025.2.0"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/dask-2025.2.0.tar.gz
requires:
  - Python
  - setuptools
  - pip
  - graphviz
  - graphviz_py
  - PyYAML
  - fsspec
  - toolz
  - partd
  - cloudpickle
  - packaging
  - versioneer
  - importlib_metadata
  - click
  - pyarrow
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