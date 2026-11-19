package: asiofi
description: asiofi FairMQ async transport based on Asio
version: "0.5.1"
tag: "v0.5.1"
source: https://github.com/FairRootGroup/asiofi.git
requires:
  - CMake
  - asio
  - ofi
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: LGPL-3.0-or-later
---
#!/bin/bash -e
##############################
. $(bits-include CMakeRecipe)
##############################
MODULE_OPTIONS="--bin --lib"
##############################
function Configure() {
  # asiofi vendors FairCMakeModules as a git submodule, but bits doesn't recurse
  # submodules so the dir is empty and the build fails. Populate it here, operating
  # on $BITS_CMAKE_SRC (rsynced with .git), never the read-only $SOURCEDIR.
  git -C "$BITS_CMAKE_SRC" submodule update --init --recursive

  # FairCMakeModules' own cmake predates the minimum CMake >= 4 will accept; the
  # env var lets the nested cmake configure with the old policy floor.
  export CMAKE_POLICY_VERSION_MINIMUM=3.5

  # asiofi's FindOFI.cmake mis-sets PKG_CONFIG_PATH in a foreach loop, so
  # libfabric.pc is never found and the version check fails. Passing OFI_ROOT as a
  # cmake variable triggers the if(OFI_ROOT) block that sets PKG_CONFIG_PATH right.
  cmake -S "$BITS_CMAKE_SRC" -B "$BITS_CMAKE_BUILD" \
      -DCMAKE_INSTALL_PREFIX="${INSTALLROOT}" \
    ${CMAKE_PREFIX_PATH:+-DCMAKE_PREFIX_PATH="${CMAKE_PREFIX_PATH}"} \
      -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_CXX_STANDARD=17 \
    -DCMAKE_POLICY_VERSION_MINIMUM=3.5 \
    -DOFI_ROOT="${OFI_ROOT}" \
    -DBUILD_SHARED_LIBS=ON
}
