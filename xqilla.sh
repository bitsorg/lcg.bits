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
  # The build env exports the dependency prefix as XERCESC_ROOT (uppercase);
  # the mixed-case ${XercesC_ROOT} expands empty, so configure could not find
  # the Xerces-C include directory.
  #
  # XQilla 2.3.4's UniqueNodesResult comparator (XQDocumentOrder.hpp) has a
  # non-const operator(). Under C++17 libstdc++ enforces "comparison object must
  # be invocable as const" via a static_assert (guarded by __cplusplus >=
  # 201703L), which gcc 15 hits because it now defaults to gnu++17. This is
  # C++03-era code, so build it as gnu++14 to skip that assert (alternative
  # would be patching the comparator to be const-qualified).
  ./configure --prefix=$INSTALLROOT --with-xerces=${XERCESC_ROOT} --disable-rpath \
    CXXFLAGS="${CXXFLAGS:-} -std=gnu++14"
}
