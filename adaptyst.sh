package: adaptyst
description: Adaptyst performance profiling framework (CERN)
# Adaptyst has no release tarball on the LCG mirror (adaptyst-HEAD.tar.gz 404s);
# under dev4 (HEAD) track the upstream git default branch.
version: "main"
tag: "main"
source: https://github.com/Adaptyst/Adaptyst.git
requires:
  - CMake
  - Boost
  - jsonmcpp
  - poco
  - cli11
  - libarchive
  - libbpf
  - libnuma
  - libtraceevent
  - yacc-like
  - Python
  - perf
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
  cmake "${SOURCEDIR}" \
      -DCMAKE_INSTALL_PREFIX="${INSTALLROOT}" \
    ${CMAKE_PREFIX_PATH:+-DCMAKE_PREFIX_PATH="${CMAKE_PREFIX_PATH}"} \
      -DCMAKE_BUILD_TYPE=Release \
    -DADAPTYST_SCRIPT_PATH="$INSTALLROOT/share/adaptyst" \
    -DADAPTYST_CONFIG_PATH="$INSTALLROOT/etc/adaptyst.conf" \
    -DCMAKE_CXX_STANDARD=17 \
    -DPERF_DIR="${PERF_ROOT}"
}
