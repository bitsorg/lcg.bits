package: metakernel
description: metakernel Python package
version: "0.30.2"
tag: "0.30.2"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/metakernel-0.30.2.tar.gz
requires:
  - Python
  - setuptools
  - ipython
  - pexpect
  - ipykernel
  - ipyparallel
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