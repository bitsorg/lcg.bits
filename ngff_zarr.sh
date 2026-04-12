package: ngff_zarr
description: ngff_zarr Python package
version: "0.10.2"
tag: "0.10.2"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/ngff_zarr-0.10.2.tar.gz
requires:
  - Python
  - pip
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