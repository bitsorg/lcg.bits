package: PyHEADTAIL
description: PyHEADTAIL macroparticle tracking code for accelerator beams
version: "1.16.5"
tag: "1.16.5"
requires:
  - Python
  - numpy
  - cython
  - h5py
  - scipy
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: GPL-3.0-or-later
---
#!/bin/bash -e
##############################
. $(bits-include PythonPipRecipe)
##############################
MODULE_OPTIONS="--bin --python"
##############################
