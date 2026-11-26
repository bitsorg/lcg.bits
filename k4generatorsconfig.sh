package: k4generatorsconfig
description: Key4hep generator configuration package
version: "1.0.1-alpha"
tag: "v1.0.1-alpha"
source: https://github.com/key4hep/k4GeneratorsConfig.git
requires:
  - CMake
  - podio
  - EDM4hep
  - hepmc3
  - HepPDT
  - pythia8
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: Apache-2.0
env:
  K4GENERATORSCONFIG: "$K4GENERATORSCONFIG_ROOT/share/k4GeneratorsConfig"
prepend_path:
  PYTHONPATH:
    - "$K4GENERATORSCONFIG_ROOT/python"
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
setenv K4GENERATORSCONFIG $PKG_ROOT/share/k4GeneratorsConfig
if {[file isdirectory $PKG_ROOT/python]} { prepend-path PYTHONPATH $PKG_ROOT/python }
EoF
}
