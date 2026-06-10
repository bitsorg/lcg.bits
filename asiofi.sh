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
  # bits doesn't recurse submodules, so asiofi's vendored FairCMakeModules (a
  # submodule) is empty and its bundled-copy fallback fails. Populate submodules
  # (needs network; operate on SOURCEDIR for the out-of-source build).
  git -C "$SOURCEDIR" submodule update --init --recursive

  # FairCMakeModules' own cmake predates the minimum CMake >= 4 will accept; the
  # env var lets the nested cmake configure with the old policy floor.
  export CMAKE_POLICY_VERSION_MINIMUM=3.5

  # asiofi's vendored FindOFI mis-sets PKG_CONFIG_PATH so libfabric.pc isn't
  # found (empty version -> too-old check). Passing OFI_ROOT as a cmake variable
  # (bits only exports the env var) triggers the block that sets it correctly.
  cmake "${SOURCEDIR}" \
      -DCMAKE_INSTALL_PREFIX="${INSTALLROOT}" \
    ${CMAKE_PREFIX_PATH:+-DCMAKE_PREFIX_PATH="${CMAKE_PREFIX_PATH}"} \
      -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_CXX_STANDARD=17 \
    -DCMAKE_POLICY_VERSION_MINIMUM=3.5 \
    -DOFI_ROOT="${OFI_ROOT}" \
    -DBUILD_SHARED_LIBS=ON
}
