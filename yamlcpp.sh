package: yamlcpp
description: yaml-cpp YAML parser and emitter library for C++
version: "0.6.3"
source: https://github.com/jbeder/yaml-cpp
tag: "yaml-cpp-%(version)s"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/yaml-cpp-0.6.3.tar.gz
requires:
  - CMake
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: MIT
---
#!/bin/bash -e
##############################
. $(bits-include CMakeRecipe)
##############################
MODULE_OPTIONS="--bin --lib --cmake --root"
##############################
function Configure() {
  cmake -S "$BITS_CMAKE_SRC" -B "$BITS_CMAKE_BUILD" \
      -DCMAKE_INSTALL_PREFIX="${INSTALLROOT}" \
    ${CMAKE_PREFIX_PATH:+-DCMAKE_PREFIX_PATH="${CMAKE_PREFIX_PATH}"} \
      -DCMAKE_BUILD_TYPE=Release \
    -DYAML_BUILD_SHARED_LIBS=ON \
    -DYAML_CPP_BUILD_TESTS=OFF \
    -DCMAKE_SKIP_RPATH=YES
}
function PostInstall() {
  printf 'setenv YAMLCPP_INCLUDE_DIR $PKG_ROOT/include\n' >> "$INSTALLROOT/etc/modulefiles/$PKGNAME"
}
