package: hepstats
description: hepstats modelling and fitting statistics utilities (HEP)
version: "0.9.2"
tag: "0.9.2"
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
. $(bits-include PythonPipRecipe)
##############################
MODULE_OPTIONS="--bin --python"
##############################