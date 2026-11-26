package: k4mljettagger
description: Key4hep ML-based jet flavor tagger
version: "0.1.1"
tag: "v0.1.1"
source: https://github.com/key4hep/k4MLJetTagger.git
requires:
  - CMake
  - EDM4hep
  - k4fwcore
  - ROOT
  - onnxruntime
  - DD4hep
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: Apache-2.0
prepend_path:
  PYTHONPATH:
    - "$K4MLJETTAGGER_ROOT/python"
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
if {[file isdirectory $PKG_ROOT/python]} { prepend-path PYTHONPATH $PKG_ROOT/python }
EoF
}
