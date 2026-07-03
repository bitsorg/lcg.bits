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
. $(bits-include BitsMacOS)
##############################
MODULE_OPTIONS="--bin --lib"
##############################
function Configure() {
  # macOS: RapidSim's CMakeLists hardcodes x86 SIMD flags that clang rejects on
  # arm64; strip them. Also drop -Werror so Apple clang's warnings from ROOT
  # v6.40 headers don't turn fatal. Patch the build COPY ($BITS_CMAKE_SRC), not
  # read-only $SOURCEDIR. Linux is untouched (bits_is_macos is false).
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
