package: pythonsollya
description: Python-Sollya Python interface to the Sollya library
version: "0.3"
tag: "0.3"
sources:
  # For versions < 0.4.0 the hosted tarball is pythonsollya-<ver>.tgz (the
  # "release-…tar.gz" naming only applies to >= 0.4.0-alpha0), per lcgcmake.
  - https://lcgpackages.web.cern.ch/tarFiles/sources/pythonsollya-%(version)s.tgz
requires:
  - Python
  - cython
  - mpfi
  - sollya
  - six
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: LGPL-3.0-or-later
patches:
  - pythonsollya-0.3.patch
---
#!/bin/bash -e
##############################
. $(bits-include PythonRecipe)
##############################
MODULE_OPTIONS="--bin --python"
##############################
# python-sollya's Makefile (driven by the pip build) defaults to PYTHON=python2
# (hence "python2: Permission denied") and needs the sollya/mpfi/mpfr/gmp
# locations. lcgcmake passes these explicitly on the make line; export them so
# the build uses Python 3 and finds the libraries.
export PYTHON="${PYTHON_ROOT}/bin/python"
export SOLLYA_DIR="${SOLLYA_ROOT}"
export MPFI_DIR="${MPFI_ROOT}"
[ -n "${MPFR_ROOT}" ] && export MPFR_DIR="${MPFR_ROOT}"
[ -n "${GMP_ROOT}" ]  && export GMP_DIR="${GMP_ROOT}"
##############################