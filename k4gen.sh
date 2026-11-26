package: k4gen
description: Key4hep generator wrapper algorithms
version: "0.1pre15"
tag: "v0.1pre15"
source: https://github.com/key4hep/k4gen.git
requires:
  - CMake
  - podio
  - EDM4hep
  - k4fwcore
  - fastjet
  - HepPDT
  - hepmc3
  - evtgen
  - pythia8
  - ROOT
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: Apache-2.0
env:
  K4GEN: "$K4GEN_ROOT/share/k4Gen"
prepend_path:
  PYTHONPATH:
    - "$K4GEN_ROOT/python"
---
#!/bin/bash -e
##############################
. $(bits-include CMakeRecipe)
##############################
MODULE_OPTIONS="--bin --lib --root-inc"
##############################
function Configure() {
  cmake -S "$BITS_CMAKE_SRC" -B "$BITS_CMAKE_BUILD" \
      -DCMAKE_INSTALL_PREFIX="${INSTALLROOT}" \
    ${CMAKE_PREFIX_PATH:+-DCMAKE_PREFIX_PATH="${CMAKE_PREFIX_PATH}"} \
      -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_CXX_STANDARD=${CXXSTD:-20} \
    -DBUILD_TESTING=OFF \
    -DPython_ROOT_DIR="${Python_ROOT}" \
    -DCMAKE_INTERPROCEDURAL_OPTIMIZATION="${ENABLE_IPO}"
}
function PostInstall() {
  cat >> "$INSTALLROOT/etc/modulefiles/$PKGNAME" <<'EoF'
setenv K4GEN $PKG_ROOT/share/k4Gen
if {[file isdirectory $PKG_ROOT/python]} { prepend-path PYTHONPATH $PKG_ROOT/python }
EoF
}
