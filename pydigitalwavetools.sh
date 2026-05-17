package: pydigitalwavetools
description: pyDigitalWaveTools Python digital waveform tools
version: "1.1"
tag: "1.1"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/pyDigitalWaveTools-1.1.tar.gz
requires:
  - Python
  - setuptools
  - pip
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: MIT
---
#!/bin/bash -e
##############################
. $(bits-include PythonRecipe)
##############################
MODULE_OPTIONS="--bin --python"
##############################