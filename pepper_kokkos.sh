package: pepper_kokkos
description: PEPPER track reconstruction package with Kokkos backend
version: "1.8.0"
tag: "1.8.0"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/MCGeneratorsTarFiles/pepper-1.8.0-kokkos.tar.gz
requires:
  - lhapdf
  - kokkos
  - hepmc3
  - hdf5_mpi
  - zlib
  - openmpi
build_requires:
  - bits-recipe-tools
license: BSD-3-Clause
---
#!/bin/bash -e
##############################
. $(bits-include CMakeRecipe)
##############################
MODULE_OPTIONS="--bin --lib"
##############################
function Configure() {
  cmake $SOURCEDIR \
    -DCMAKE_INSTALL_PREFIX=$INSTALLROOT \
    -DCMAKE_BUILD_TYPE=Release \
    -DPEPPER_VCL_DISABLED=1
}
