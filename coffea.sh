package: coffea
description: Coffea Columnar Object Framework For Effective Analysis
version: "2025.12.0"
tag: "2025.12.0"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/coffea-2025.12.0.tar.gz
requires:
  - bokeh
  - dask
  - distributed
  - ipywidgets
  - parsl
  - tcut_to_qastle
  - torch
  - aiohttp
  - loky
  - awkward
  - cachetools
  - cloudpickle
  - correctionlib
  - fsspec
  - fsspec_xrootd
  - hist
  - py_lz4
  - lz4
  - matplotlib
  - mplhep
  - numba
  - numpy
  - packaging
  - pandas
  - pyarrow
  - scipy
  - toml
  - tqdm
  - uproot
  - aiostream
  - dask_awkward
  - dask_histogram
  - vector
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