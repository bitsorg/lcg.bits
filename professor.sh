package: professor
description: Professor Monte Carlo generator tuning tool
version: "2.5.6"
tag: "2.5.6"
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
# professor's Makefile probes `python -c 'import Cython; print(Cython.__version__)'`
# and aborts ("Incompatible Cython NONE found") when Cython is not importable;
# its build also imports numpy.  bits exposes each dependency's $*_ROOT but not
# its Python site-packages, so put every dependency's site-packages on PYTHONPATH
# at recipe scope (applies to both Configure and Make).
bits_pythonpath_from_deps
# professor's Makefile forms the C++ standard flag as `-std=$(CXXSTD)`, but bits
# exports CXXSTD as a bare number (e.g. 23, for -DCMAKE_CXX_STANDARD), so g++
# sees the invalid `-std=23`. Hand professor the `c++NN` token its Makefile
# expects (this matches the c++23 that ROOT, a dependency, is built with).
export CXXSTD="c++${CXXSTD:-17}"
##############################
function Configure() {
  ./configure --prefix=$INSTALLROOT --with-eigen=${EIGEN_ROOT} URL ${gen_url}/professor-2.5.6.tar.gz
}
