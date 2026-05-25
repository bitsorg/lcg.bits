package: apfel
description: APFEL parton distribution function evolution library
version: "3.0.4"
tag: "3.0.4"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/MCGeneratorsTarFiles/%(name)s-%(version)s.tar.gz
requires:
  - lhapdf
  - swig
  - Python
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: GPL-3.0-or-later
---
#!/bin/bash -e
##############################
. $(bits-include AutoToolsRecipe)
##############################
MODULE_OPTIONS="--bin --lib"
##############################
function Configure() {
  [ -f autogen.sh ] && ./autogen.sh
  ./configure --prefix="${INSTALLROOT}" \
    --enable-python \
    ${LHAPDF_ROOT:+--with-lhapdf="${LHAPDF_ROOT}"} \
    ${PYTHON_EXE:+PYTHON="${PYTHON_EXE}"}
}
