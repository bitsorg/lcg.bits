package: octavekernel
description: octavekernel Python package
version: "0.32.0"
tag: "0.32.0"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/octave_kernel-0.32.0.tar.gz
requires:
  - Python
  - setuptools
  - octave
  - metakernel
  - jupyter_client
  - ipykernel
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