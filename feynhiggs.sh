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
function Prepare() {
  rsync -av --delete --exclude '**/.git' --delete-excluded "${SOURCEDIR}"/ ./
  # HiggsProd.F passes O'155' (octal BOZ) as a subroutine argument; GCC 15
  # rejects this even with -fallow-invalid-boz.  Replace with the decimal value.
  find . -name 'HiggsProd.F' -exec sed -i "s/O'155'/109/g" {} \;
}
function Configure() {
  ./configure --prefix="$INSTALLROOT" F77=${FC:-gfortran} \
    "FFLAGS=-fPIC -fallow-invalid-boz -fallow-argument-mismatch" CFLAGS=-fPIC
}
