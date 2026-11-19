package: professor
description: Professor Monte Carlo generator tuning tool
version: "2.5.6"
source: https://github.com/Professor2/Professor
tag: "v%(version)s"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/MCGeneratorsTarFiles/%(name)s-%(version)s.tar.gz
requires:
  - Python
  - cython
  - matplotlib
  - numpy
  - yoda
  - sympy
  - eigen
  - wheel
  - iminuit
  - ROOT
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: GPL-3.0-or-later
---
#!/bin/bash -e
##############################
. $(bits-include AutoToolsRecipe)
. $(bits-include BitsPython)
##############################
MODULE_OPTIONS="--bin --lib"
##############################
# professor's Makefile imports Cython (aborting if absent) and numpy, but bits exposes
# each dep's $*_ROOT and not its site-packages; put every dep's site-packages on
# PYTHONPATH at recipe scope (both Configure and Make).
bits_pythonpath_from_deps
# professor's Makefile builds the flag as `-std=$(CXXSTD)`, but bits exports CXXSTD as a
# bare number (e.g. 23), yielding an invalid `-std=23`; hand it the `c++NN` token instead
# (matches the c++23 that its ROOT dependency uses).
export CXXSTD="c++${CXXSTD:-17}"
##############################
function Configure() {
  ./configure --prefix=$INSTALLROOT --with-eigen=${EIGEN_ROOT} URL ${gen_url}/professor-2.5.6.tar.gz
}
