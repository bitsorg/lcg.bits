package: xqilla
description: XQilla XQuery and XPath 2.0 library
version: "2.3.4"
tag: "2.3.4"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/XQilla-2.3.4.tar.gz
requires:
  - XercesC
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: Apache-2.0
---
#!/bin/bash -e
##############################
. $(bits-include AutoToolsRecipe)
##############################
MODULE_OPTIONS="--bin --lib"
##############################
function Configure() {
  # bits exports XERCESC_ROOT (uppercase); the mixed-case ${XercesC_ROOT} expands
  # empty so configure couldn't find Xerces-C.
  # XQilla's non-const comparator trips libstdc++'s C++17 const-invocable
  # static_assert under gcc15's gnu++17 default; build as gnu++14 to skip it.
  ./configure --prefix=$INSTALLROOT --with-xerces=${XERCESC_ROOT} --disable-rpath \
    CXXFLAGS="${CXXFLAGS:-} -std=gnu++14"
}
