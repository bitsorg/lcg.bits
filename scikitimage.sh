package: scikitimage
description: scikit-image image processing algorithms for Python
version: "0.26.0"
source: https://github.com/scikit-image/scikit-image
tag: "v%(version)s"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/scikit_image-%(version)s.tar.gz
requires:
  - Python
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
# meson runs a Cython sanity check that #includes Python.h before it resolves
# the Python dependency, so Python's include dir is not on the search path. Put
# CPython's versioned header dir (include/python<maj.min>) on CPATH. Per-recipe
# stopgap until Python advertises this on CPATH for all consumers.
_pyabi="${PYTHON_ROOT}/include/python${PYTHON_MAJOR_MINOR}"
[ -d "${_pyabi}" ] && export CPATH="${_pyabi}${CPATH:+:${CPATH}}"
unset _pyabi
##############################
