package: servicex
description: servicex Python package
version: "3.1.0"
tag: "3.1.0"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/servicex-3.1.0.tar.gz
requires:
  - Python
  - setuptools
  - pip
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
license: TODO
---
#!/bin/bash -e
##############################
. $(bits-include PythonRecipe)
##############################
MODULE_OPTIONS="--python"
##############################