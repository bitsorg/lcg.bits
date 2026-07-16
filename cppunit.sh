package: CppUnit
description: CppUnit C++ unit testing framework (port of JUnit)
version: "1.15.1"
source: https://github.com/Stephane/svn2git-cppunit
tag: "v%(version)s"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/cppunit-1.15.1.tar.gz
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: LGPL-2.1-or-later
---
#!/bin/bash -e
##############################
. $(bits-include AutoToolsRecipe)
##############################
MODULE_OPTIONS="--bin --lib"
##############################
function Configure() {
  ./configure --prefix $INSTALLROOT
}
