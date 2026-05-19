package: servicex
description: ServiceX data delivery service for HEP analysis
version: "3.1.0"
tag: "3.1.0"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/servicex-3.1.0.tar.gz
requires:
  - Python
  - aiohttp
  - awkward
  - dask_awkward
  - backoff
  - confuse
  - google_auth
  - cachetools
  - pyasn1_modules
  - idna
  - make_it_sync
  - minio
  - pandas
  - pyarrow
  - qastle
  - tqdm
  - uproot
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