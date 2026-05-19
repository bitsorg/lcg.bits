package: hepmc3
description: HepMC3 Monte Carlo event record library
version: "HEAD"
tag: "HEAD"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/HepMC3-HEAD.tar.gz
requires:
  - CMake
  - ROOT
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: LGPL-2.1-only
---
#!/bin/bash -e
##############################
. $(bits-include CMakeRecipe)
##############################
MODULE_OPTIONS="--bin --lib --root-inc"
##############################
function Configure() {
  cmake "${SOURCEDIR}" \
      -DCMAKE_INSTALL_PREFIX="${INSTALLROOT}" \
      -DCMAKE_BUILD_TYPE=Release \
    -DROOT_DIR=${ROOT_ROOT} \
    -DHEPMC3_INSTALL_INTERFACES=ON \
    -DHEPMC3_Python_SITEARCH${Python_config_version_twodigit_nodot}=$INSTALLROOT/lib/python${Python_config_version_twodigit}/site-packages \
    -DHEPMC3_PYTHON_VERSIONS=${Python_config_version_twodigit}
}
