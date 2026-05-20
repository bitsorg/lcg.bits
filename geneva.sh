package: geneva
description: Geneva stochastic global optimisation framework
version: "1.0-rc3.atlas2"
tag: "1.0-rc3.atlas2"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/MCGeneratorsTarFiles/geneva-1.0-rc3.atlas2.tar.gz
requires:
  - CMake
  - lhapdf
  - openloops
  - zlib
  - GSL
  - Python
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: Apache-2.0
patches:
  - geneva-1.0-rc3.atlas2.patch
---
#!/bin/bash -e
##############################
. $(bits-include CMakeRecipe)
##############################
MODULE_OPTIONS="--bin --lib"
##############################
function Configure() {
  cmake "${SOURCEDIR}" \
      -DCMAKE_INSTALL_PREFIX="${INSTALLROOT}" \
      -DCMAKE_BUILD_TYPE=Release \
    -Dgeneva_enable_hepmc=OFF \
    -Dgeneva_enable_lhapdf=ON \
    -Dgeneva_enable_openloops=ON \
    -Dgeneva_enable_pythia8=OFF \
    -Dgeneva_enable_python=ON \
    -Dopenloops_ROOT="${OPENLOOPS_ROOT}" \
    -Dlhapdf_ROOT="${LHAPDF_ROOT}"
}
function Make() {
  make ${JOBS:+-j $JOBS} beamfunc-install-data
make ${JOBS:+-j $JOBS}
}
