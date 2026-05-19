package: scikitimage
description: scikit-image image processing algorithms for Python
version: "0.25.2"
tag: "0.25.2"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/scikit-image-0.25.2.tar.gz
requires:
  - Python
  - pip
  - pillow
  - numpy
  - cython
  - scipy
  - matplotlib
  - imageio
  - networkx
  - pywt
  - cloudpickle
  - packaging
  - tifffile
  - lazy_loader
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