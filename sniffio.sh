package: sniffio
description: sniffio detect which async library is being used
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
  - "GCC-Toolchain:(?!osx)"
license: MIT OR Apache-2.0
---
#!/bin/bash -e
##############################
. $(bits-include PythonRecipe)
##############################
MODULE_OPTIONS="--bin --python"
##############################