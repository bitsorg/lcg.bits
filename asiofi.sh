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
  # asiofi vendors FairCMakeModules (under extern/) as a git submodule and falls
  # back to building that bundled copy when find_package(FairCMakeModules) fails.
  # bits checks out the git source but does NOT recurse submodules, so the
  # submodule dir is empty and the bundle's git step fails ("pathspec
  # extern/FairCMakeModules did not match"). Populate the submodules here, at the
  # commit asiofi v0.5.1 pins, before configuring. (Requires network at configure
  # time; operate on $SOURCEDIR since the out-of-source cmake reads from there.)
  git -C "$SOURCEDIR" submodule update --init --recursive

  # FairCMakeModules' own cmake predates the minimum CMake >= 4 will accept; the
  # env var lets the nested cmake configure with the old policy floor.
  export CMAKE_POLICY_VERSION_MINIMUM=3.5

  # asiofi's vendored cmake/FindOFI.cmake locates libfabric via pkg-config. It
  # tries to add OFI's pkgconfig dir to PKG_CONFIG_PATH from CMAKE_PREFIX_PATH in
  # a foreach loop that overwrites the variable each iteration (CMake's
  # set(ENV{...}) keeps only the first arg), so it ends up pointing at the wrong
  # prefix and libfabric.pc is never found — the version check then fails against
  # an empty OFI_VERSION ("Required is at least version 1.6.0"). Passing OFI_ROOT
  # as a *cmake variable* (bits only exports the env var) triggers the dedicated
  # if(OFI_ROOT) block, which runs last and sets PKG_CONFIG_PATH to OFI's own
  # pkgconfig dir, so pkg-config finds libfabric.pc and reports 1.22.0.
  cmake -S "$BITS_CMAKE_SRC" -B "$BITS_CMAKE_BUILD" \
      -DCMAKE_INSTALL_PREFIX="${INSTALLROOT}" \
    ${CMAKE_PREFIX_PATH:+-DCMAKE_PREFIX_PATH="${CMAKE_PREFIX_PATH}"} \
      -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_CXX_STANDARD=17 \
    -DCMAKE_POLICY_VERSION_MINIMUM=3.5 \
    -DOFI_ROOT="${OFI_ROOT}" \
    -DBUILD_SHARED_LIBS=ON
}
