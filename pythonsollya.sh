package: pythonsollya
description: Python-Sollya Python interface to the Sollya library
version: "0.3"
source: https://gitlab.com/metalibm-dev/pythonsollya
tag: "v%(version)s"
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
# The *_DIR vars only reach the Makefile's CPPFLAGS; the actual cython->C
# compile is driven by pip/setup.py and never sees them, so it fails with
# "sollya.h: No such file or directory". CPATH/LIBRARY_PATH are honoured by
# every gcc/cpp invocation regardless of build system, so the cython step finds
# the headers and libraries.
export CPATH="${SOLLYA_ROOT}/include:${MPFI_ROOT}/include${MPFR_ROOT:+:${MPFR_ROOT}/include}${GMP_ROOT:+:${GMP_ROOT}/include}${CPATH:+:${CPATH}}"
export LIBRARY_PATH="${SOLLYA_ROOT}/lib:${MPFI_ROOT}/lib${MPFR_ROOT:+:${MPFR_ROOT}/lib}${GMP_ROOT:+:${GMP_ROOT}/lib}${LIBRARY_PATH:+:${LIBRARY_PATH}}"
##############################