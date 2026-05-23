package: hijing
description: HIJING heavy-ion jet interaction generator
version: "1.383bs.2"
tag: "1.383bs.2"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/MCGeneratorsTarFiles/hijing-1.383bs.2-src.tgz
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: LicenseRef-HIJING
patches:
  - hijing-1.383bs.2.patch
---
#!/bin/bash -e
##############################
. $(bits-include AutoToolsRecipe)
##############################
MODULE_OPTIONS="--lib"
##############################
function Configure() {
  # HIJING configure does not understand --prefix (it prints "wrong option.
  # Ignored." and continues).  Export F77 so the Makefile default (g77) is
  # overridden when we pass F77=... on the make command line.
  export F77=${FC:-gfortran}
  ./configure
}

function Make() {
  make ${JOBS:+-j $JOBS} F77=${FC:-gfortran}
  # configure ignored --prefix so install manually.
  mkdir -p "${INSTALLROOT}/lib"
  cp -p lib/libhijing.* "${INSTALLROOT}/lib/"
  # Fortran COMMON-block include files, if the tarball ships them.
  [[ -d include ]] && { mkdir -p "${INSTALLROOT}/include"; cp -rp include/. "${INSTALLROOT}/include/"; }
}
