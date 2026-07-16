package: xqilla
description: XQilla XQuery and XPath 2.0 library
version: "2.3.4"
source: https://github.com/xqilla/xqilla
tag: "v%(version)s"
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
  # bits exports the dependency prefix as XERCESC_ROOT (uppercase), so ${XercesC_ROOT} was
  # empty and configure couldn't find Xerces-C. Also XQilla 2.3.4's non-const comparator
  # trips C++17 libstdc++'s const-invocable static_assert under gcc 15, so build as gnu++14.
  ./configure --prefix=$INSTALLROOT --with-xerces=${XERCESC_ROOT} --disable-rpath \
    CXXFLAGS="${CXXFLAGS:-} -std=gnu++14"
}
