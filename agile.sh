package: agile
description: AGILe Automated General Interface for Legacy Experiments
version: "unknown"
tag: "unknown"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/MCGeneratorsTarFiles/AGILe-unknown.tar.bz2
requires:
  - HepMC
  - Boost
  - Python
  - swig
  - future
  - autoconf
  - automake
  - libtool
build_requires:
  - bits-recipe-tools
license: TODO
---
#!/bin/bash -e
##############################
. $(bits-include AutoToolsRecipe)
##############################
MODULE_OPTIONS="--bin --lib"
##############################
function Configure() {
  rsync -a --delete --exclude '**/.git' $SOURCEDIR/ .
  autoreconf -vif COMMAND ./configure --prefix=$INSTALLROOT --with-hepmc=${HepMC_ROOT} --with-boost-incpath=${Boost_home_include} --with-lcgtag=${BITS_PLATFORM:-linux} PYTHON=${Python_ROOT}/bin/python3 ${library_path}=${Python_ROOT}/lib:${pcre_ROOT}/lib:$ENV{${library_path}} SWIG=${swig_ROOT}/bin/swig SWIG_LIB=${swig_ROOT}/share/swig/${swig_author_version}
}