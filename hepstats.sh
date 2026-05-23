package: hepstats
description: hepstats modelling and fitting statistics utilities (HEP)
version: "0.9.2"
tag: "0.9.2"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/%(name)s-%(version)s.tar.gz
requires:
  - Python
  - asdf
  - numpy
  - pandas
  - scipy
  - tqdm
  - uhi
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