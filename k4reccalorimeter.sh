package: k4reccalorimeter
description: Key4hep calorimeter reconstruction algorithms
version: "0.1.0pre18"
tag: "v0.1.0pre18"
source: https://github.com/HEP-FCC/k4RecCalorimeter.git
requires:
  - CMake
  - podio
  - EDM4hep
  - k4fwcore
  - DD4hep
  - k4geo
  - marlinutil
  - fastjet
  - k4simgeant4
  - ROOT
  - onnxruntime
  - simsipm
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: Apache-2.0
env:
  K4RECCALORIMETER: "$K4RECCALORIMETER_ROOT/share/k4RecCalorimeter"
prepend_path:
  PYTHONPATH:
    - "$K4RECCALORIMETER_ROOT/python"
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
    -DCMAKE_INTERPROCEDURAL_OPTIMIZATION="${ENABLE_IPO}"
}
function PostInstall() {
  cat >> "$INSTALLROOT/etc/modulefiles/$PKGNAME" <<'EoF'
setenv K4RECCALORIMETER $PKG_ROOT/share/k4RecCalorimeter
if {[file isdirectory $PKG_ROOT/python]} { prepend-path PYTHONPATH $PKG_ROOT/python }
EoF
}
