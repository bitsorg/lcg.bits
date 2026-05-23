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
  # Ignored." and continues), so we install manually in Make().
  # The Makefile fragments hardcode 'g77' as a literal (not $(F77)), so
  # sed-replace it with the actual Fortran compiler after configure runs.
  export F77=${FC:-gfortran}
  ./configure
  find . \( -name "Make*.subdir" -o -name "Makefile" \) \
    -exec sed -i "s/\bg77\b/${F77}/g" {} \;
}

function Make() {
  make ${JOBS:+-j $JOBS}
  # configure ignored --prefix so install manually.
  mkdir -p "${INSTALLROOT}/lib"
  cp -p lib/libhijing.* "${INSTALLROOT}/lib/"
  # Fortran COMMON-block include files, if the tarball ships them.
  [[ -d include ]] && { mkdir -p "${INSTALLROOT}/include"; cp -rp include/. "${INSTALLROOT}/include/"; }
}
