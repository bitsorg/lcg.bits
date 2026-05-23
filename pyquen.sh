package: pyquen
description: PYQUEN parton quenching model for heavy-ion collisions
version: "1.5.1"
tag: "1.5.1"
sources:
  # Single Fortran source file; author tag 1_5 encodes version 1.5.1
  - https://lcgpackages.web.cern.ch/tarFiles/sources/MCGeneratorsTarFiles/pyquen1_5.f
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: LicenseRef-PYQUEN
---
#!/bin/bash -e
##############################
. $(bits-include MakeRecipe)
##############################
MODULE_OPTIONS="--lib"
##############################
function Prepare() {
  rsync -av --delete --exclude '**/.git' --delete-excluded "${SOURCEDIR}"/ ./
  # Rename the author-tagged filename to a plain name for the compiler commands
  local src
  src=$(ls pyquen*.f 2>/dev/null | head -1)
  [ -n "$src" ] && [ "$src" != "pyquen.f" ] && mv "$src" pyquen.f
}

function Make() {
  ${FC:-gfortran} -O2 -fPIC -c pyquen.f -o pyquen.o
  ${FC:-gfortran} -O2 -shared -o libpyquen.so pyquen.o
  ${AR:-ar} crs libpyquen.a pyquen.o
}

function MakeInstall() {
  install -dm755 "$INSTALLROOT/lib"
  install -m755 libpyquen.so "$INSTALLROOT/lib/"
  install -m644 libpyquen.a "$INSTALLROOT/lib/"
}
