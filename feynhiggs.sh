package: feynhiggs
description: FeynHiggs program for MSSM Higgs mass calculations
version: "2.10.2"
source: https://github.com/feynhiggs/feynhiggs
tag: "v%(version)s"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/MCGeneratorsTarFiles/FeynHiggs-2.10.2.tar.gz
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: LicenseRef-FeynHiggs
# academic-use licence with no redistribution grant (2026-07-20 license ruling): build and private-store reuse are
# fine, but this package must never be laid into a public CVMFS tree.
redistributable: none
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
  # Several .F files pass O'155' (octal BOZ = 109 decimal) as subroutine arguments;
  # GCC 15 rejects this even with -fallow-invalid-boz.  Replace with the decimal value.
  find . -name '*.F' -exec perl -i -pe "s/O'155'/109/g" {} \;
}
function Configure() {
  ./configure --prefix="$INSTALLROOT" F77=${FC:-gfortran} \
    "FFLAGS=-fPIC -fallow-invalid-boz -fallow-argument-mismatch" CFLAGS=-fPIC
}
