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
  ./configure --prefix=$INSTALLROOT --with-xerces=${XERCESC_ROOT} --disable-rpath
}
