package: pyhf
description: pyhf pure-Python HistFactory statistical model (HEP)
version: "0.7.6"
tag: "0.7.6"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/pyhf-0.7.6.tar.gz
requires:
  - Python
  - pip
  - iminuit
  - numpy
  - scipy
  - torch
  - jax
  - jaxlib
  - requests
  - matplotlib
  - jsonschema
  - jsonpatch
  - click
  - tqdm
  - uproot
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: Apache-2.0
---
#!/bin/bash -e
##############################
. $(bits-include PythonRecipe)
##############################
MODULE_OPTIONS="--bin --python"
##############################