package: k4_project_template
description: Key4hep project CMake template
version: "0.7.0"
tag: "v0.7.0"
source: https://github.com/key4hep/k4-project-template.git
requires:
  - CMake
  - k4fwcore
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: Apache-2.0
env:
  K4PROJECTTEMPLATE: "$K4_PROJECT_TEMPLATE_ROOT/share/k4ProjectTemplate"
prepend_path:
  PYTHONPATH:
    - "$K4_PROJECT_TEMPLATE_ROOT/python"
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
setenv K4PROJECTTEMPLATE $PKG_ROOT/share/k4ProjectTemplate
if {[file isdirectory $PKG_ROOT/python]} { prepend-path PYTHONPATH $PKG_ROOT/python }
EoF
}
