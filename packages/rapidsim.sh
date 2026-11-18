package: rapidsim
description: RapidSim fast Monte Carlo simulation for heavy-flavour decays
version: "1.4.4"
source: https://github.com/gcowan/RapidSim
tag: "v%(version)s"
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
. $(bits-include BitsMacOS)
##############################
MODULE_OPTIONS="--bin --lib"
##############################
function Configure() {
  # macOS: strip hardcoded x86 SIMD flags clang rejects on arm64, and drop -Werror so ROOT v6.40 header warnings aren't fatal
  if bits_is_macos; then
    case "$(uname -m)" in
      arm64 | aarch64)
        bits_file_replace "${BITS_CMAKE_SRC}/CMakeLists.txt" ' -msse -msse2 -msse3 -m3dnow' '' ;;
    esac
    bits_strip_token "${BITS_CMAKE_SRC}/CMakeLists.txt" -Werror
  fi
  cmake -S "$BITS_CMAKE_SRC" -B "$BITS_CMAKE_BUILD" \
      -DCMAKE_INSTALL_PREFIX="${INSTALLROOT}" \
    ${CMAKE_PREFIX_PATH:+-DCMAKE_PREFIX_PATH="${CMAKE_PREFIX_PATH}"} \
      -DCMAKE_BUILD_TYPE=Release \
    -DROOTSYS="${ROOT_ROOT}"
}
