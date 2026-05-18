package: yamlcpp
description: yaml-cpp YAML parser and emitter library for C++
version: "0.6.3"
tag: "0.6.3"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/yaml-cpp-0.6.3.tar.gz
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
  cmake \
    -DYAML_BUILD_SHARED_LIBS=ON \
    -DYAML_CPP_BUILD_TESTS=OFF \
    -DCMAKE_SKIP_RPATH=YES
}
function PostInstall() {
  printf 'setenv YAMLCPP_INCLUDE_DIR $PKG_ROOT/include\n' >> "$INSTALLROOT/etc/modulefiles/$PKGNAME"
}
