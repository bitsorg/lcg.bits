package: rapidsim
description: RapidSim fast Monte Carlo simulation for heavy-flavour decays
version: "1.4.4"
tag: "1.4.4"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/MCGeneratorsTarFiles/RapidSim-1.4.4.tar.gz
requires:
  - CMake
  - ROOT
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: Apache-2.0
---
#!/bin/bash -e
##############################
. $(bits-include CMakeRecipe)
##############################
MODULE_OPTIONS="--bin --lib"
##############################
function Configure() {
  # arm64 (Apple Silicon): RapidSim's CMakeLists.txt hardcodes x86 SIMD flags
  # (-msse -msse2 -msse3 -m3dnow) into CMAKE_CXX_FLAGS, which clang rejects on
  # arm64 ("unsupported option '-msse'"). Strip them on aarch64; x86 builds
  # (Linux, Intel macOS) keep them. Idempotent.
  case "$(uname -m)" in
    arm64 | aarch64)
      perl -i -pe 's/ -msse -msse2 -msse3 -m3dnow//' "${SOURCEDIR}/CMakeLists.txt"
      ;;
  esac
  cmake "${SOURCEDIR}" \
      -DCMAKE_INSTALL_PREFIX="${INSTALLROOT}" \
    ${CMAKE_PREFIX_PATH:+-DCMAKE_PREFIX_PATH="${CMAKE_PREFIX_PATH}"} \
      -DCMAKE_BUILD_TYPE=Release \
    -DROOTSYS="${ROOT_ROOT}"
}
