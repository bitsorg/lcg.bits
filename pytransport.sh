package: pytransport
description: PyTransport numerical transport equation solver for inflation
version: "2.0.2"
tag: "2.0.2"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/pytransport-2.0.2.tar.gz
requires:
  - Python
  - setuptools
  - numpy
  - matplotlib
  - scipy
  - importlib_metadata
  - pip
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: LicenseRef-PyTransport
---
#!/bin/bash -e
##############################
. $(bits-include PythonRecipe)
##############################
MODULE_OPTIONS="--bin --python"
##############################