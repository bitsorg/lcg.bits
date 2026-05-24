package: feynhiggs
description: FeynHiggs program for MSSM Higgs mass calculations
version: "2.10.2"
tag: "2.10.2"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/MCGeneratorsTarFiles/FeynHiggs-2.10.2.tar.gz
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: LicenseRef-FeynHiggs
patches:
  - feynhiggs-2.10.2.patch
---
#!/bin/bash -e
##############################
. $(bits-include AutoToolsRecipe)
##############################
MODULE_OPTIONS="--bin --lib"
##############################
function Configure() {
  ./configure --prefix="$INSTALLROOT" F77=${FC:-gfortran} \
    "FFLAGS=-fPIC -fallow-invalid-boz -fallow-argument-mismatch" CFLAGS=-fPIC
}
