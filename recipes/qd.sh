package: qd
description: QD double-double and quad-double floating-point library
version: "2.3.24"
source: https://github.com/JuliaMath/Quadmath
tag: "v%(version)s"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/MCGeneratorsTarFiles/%(name)s-%(version)s.tar.gz
requires:
  - Python
  - automake
  - autoconf
  - libtool
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: BSD-3-Clause
patches:
  - qd-2.3.24.patch
---
#!/bin/bash -e
##############################
. $(bits-include AutoToolsRecipe)
##############################
MODULE_OPTIONS="--bin --lib"
##############################
function Configure() {
  autoreconf --force --install
  ./configure --prefix=$INSTALLROOT --enable-shared
}
