package: sniffio
description: sniffio Python package
version: "1.3.1"
tag: "1.3.1"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/sniffio-1.3.1.tar.gz
requires:
  - Python
  - pip
  - setuptools
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