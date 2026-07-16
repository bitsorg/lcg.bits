package: cmaketools
description: CMakeTools auxiliary scripts for CMake-based builds
version: "1.9"
source: https://github.com/HSF/cmaketools.git
tag: "%(version)s"
sources:
  - https://github.com/HEP-SF/cmaketools/archive/1.9.tar.gz
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: MIT
---
#!/bin/bash -e
##############################
. $(bits-include AutoToolsRecipe)
##############################
MODULE_OPTIONS="--bin"
##############################
function Configure() { true; }
function Make()      { true; }

function MakeInstall() {
  # cmaketools is a collection of .cmake modules; no build step needed.
  mkdir -p "${INSTALLROOT}/share/CMakeTools"
  cp -r "${SOURCEDIR}/." "${INSTALLROOT}/share/CMakeTools/"
}
