package: madx
description: MAD-X accelerator optics design and tracking code
version: "5.09.00"
tag: "5.09.00"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/madx-5.09.00.tar.gz
requires:
  - zlib
  - blas
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: LicenseRef-MAD-X
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
    -DCMAKE_CXX_COMPILER=$CXX \
    -DCMAKE_C_COMPILER=$CC \
    -DCMAKE_CXX_FLAGS=$CXXFLAGS \
    -DCMAKE_OSX_ARCHITECTURES=x86_64 \
    -DMADX_ONLINE=OFF \
    -DMADX_INSTALL_DOC=OFF
}
