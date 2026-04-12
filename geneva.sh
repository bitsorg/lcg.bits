package: geneva
description: geneva Monte Carlo event generator
version: "1.0-rc3.atlas2"
tag: "1.0-rc3.atlas2"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/MCGeneratorsTarFiles/geneva-1.0-rc3.atlas2.tar.gz
requires:
  - lhapdf
  - openloops
  - zlib
  - GSL
  - Python
  - setuptools
build_requires:
  - bits-recipe-tools
license: TODO
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
  cmake $SOURCEDIR \
    -DCMAKE_INSTALL_PREFIX=$INSTALLROOT \
    -Dgeneva_enable_hepmc=OFF \
    -Dgeneva_enable_lhapdf=ON \
    -Dgeneva_enable_openloops=ON \
    -Dgeneva_enable_pythia8=OFF \
    -Dgeneva_enable_python=ON \
    -Dopenloops_ROOT=${openloops_ROOT} \
    -Dlhapdf_ROOT=${lhapdf_ROOT}
}
function Make() {
  make ${JOBS:+-j $JOBS} beamfunc-install-data COMMAND make ${JOBS:+-j $JOBS}
}
