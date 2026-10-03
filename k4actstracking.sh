package: k4actstracking
description: Key4hep ACTS tracking integration
# The derived v0.3 tag does not exist upstream; track the default branch
# (matches --defaults dev4 / HEAD).
version: "main"
tag: "main"
source: https://github.com/key4hep/k4ActsTracking.git
requires:
  - CMake
  - podio
  - EDM4hep
  - k4fwcore
  - ROOT
  - acts
build_requires:
  - bits-recipe-tools
  - k4actstracking-data
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
  # Pre-seed data/ so upstream's download script (wget, ignores failures) skips
  # every file; verify against its list so drift fails here, not at install.
  # Explicit returns: Run calls Configure in an && chain, where -e is off.
  cp "${K4ACTSTRACKING_DATA_ROOT:?}"/share/k4ActsTracking/data/* "$BITS_CMAKE_SRC/data/" || return 1
  (cd "$BITS_CMAKE_SRC/data" && awk 'NF == 2 && $1 !~ /^#/ {print $2 "  " $1}' file_list.txt | md5sum -c --quiet -) \
    || { echo "k4actstracking-data does not match data/file_list.txt; update it" >&2; return 1; }
  cmake -S "$BITS_CMAKE_SRC" -B "$BITS_CMAKE_BUILD" \
      -DCMAKE_INSTALL_PREFIX="${INSTALLROOT}" \
    ${CMAKE_PREFIX_PATH:+-DCMAKE_PREFIX_PATH="${CMAKE_PREFIX_PATH}"} \
      -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_CXX_STANDARD=${CXXSTD:-20} \
    -DBUILD_TESTING=OFF \
    -DCMAKE_INTERPROCEDURAL_OPTIMIZATION="${ENABLE_IPO}"
}
