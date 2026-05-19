package: octavekernel
description: octave_kernel Octave kernel for Jupyter notebooks
version: "0.32.0"
tag: "0.32.0"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/octave_kernel-0.32.0.tar.gz
requires:
  - Python
  - octave
  - metakernel
  - jupyter_client
  - ipykernel
  - pip
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