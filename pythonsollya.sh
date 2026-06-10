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
# python-sollya's Makefile defaults to PYTHON=python2 and needs sollya/mpfi/mpfr/
# gmp locations; export them (as lcgcmake passes on the make line).
export PYTHON="${PYTHON_ROOT}/bin/python"
export SOLLYA_DIR="${SOLLYA_ROOT}"
export MPFI_DIR="${MPFI_ROOT}"
[ -n "${MPFR_ROOT}" ] && export MPFR_DIR="${MPFR_ROOT}"
[ -n "${GMP_ROOT}" ]  && export GMP_DIR="${GMP_ROOT}"
# The *_DIR vars only reach the Makefile's CPPFLAGS, but the cython->C compile is
# driven by pip/setup.py which never sees them. CPATH/LIBRARY_PATH are honoured by
# every gcc/cpp invocation, so the cython step finds the headers and libraries.
export CPATH="${SOLLYA_ROOT}/include:${MPFI_ROOT}/include${MPFR_ROOT:+:${MPFR_ROOT}/include}${GMP_ROOT:+:${GMP_ROOT}/include}${CPATH:+:${CPATH}}"
export LIBRARY_PATH="${SOLLYA_ROOT}/lib:${MPFI_ROOT}/lib${MPFR_ROOT:+:${MPFR_ROOT}/lib}${GMP_ROOT:+:${GMP_ROOT}/lib}${LIBRARY_PATH:+:${LIBRARY_PATH}}"
##############################