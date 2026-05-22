package: dpmjet
description: DPMJET-III dual parton model for nucleus-nucleus and hadron-nucleus collisions
version: "3.0-6"
tag: "3.0-6"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/MCGeneratorsTarFiles/dpmjet3.0-6.tar.gz
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: LicenseRef-DPMJET
---
#!/bin/bash -e
##############################
. $(bits-include MakeRecipe)
##############################
MODULE_OPTIONS="--lib"
##############################
function Make() {
  rsync -av --delete --exclude '**/.git' --delete-excluded "${SOURCEDIR}"/ ./
  # Compile all Fortran sources into object files; strip -m32 and use std=legacy
  $FC -c -O2 -fno-automatic -std=legacy -fPIC \
      dpmjet3.0-6.f phojet1.12-35c4.f pythia6115dpm3v1.f
  # Bundle into a static library named libDPMJET.a (what FindDPMJet.cmake looks for)
  ar rcs libDPMJET.a dpmjet3.0-6.o phojet1.12-35c4.o pythia6115dpm3v1.o
}
function MakeInstall() {
  mkdir -p "$INSTALLROOT/lib" "$INSTALLROOT/include/dpmjet" "$INSTALLROOT/share/dpmjet"
  cp libDPMJET.a "$INSTALLROOT/lib/"
  # Data files needed at runtime
  cp dpmjet.dat fitpar.dat "$INSTALLROOT/share/dpmjet/" 2>/dev/null || true
}
function PostInstall() {
  cat >> "$INSTALLROOT/etc/modulefiles/$PKGNAME" << 'EOF'
setenv DPMJET_ROOT $PKG_ROOT
setenv DPMJET_DIR $PKG_ROOT
EOF
}
