package: google_pasta
description: google_pasta Python package
version: "0.2.0"
tag: "0.2.0"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/google-pasta-0.2.0.tar.gz
requires:
  - Python
  - setuptools
  - six
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