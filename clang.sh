package: clang
description: Clang C/C++/ObjC frontend for the LLVM compiler infrastructure
version: "6.0.0"
tag: "6.0.0"
requires:
  - binutils
  - gcc
build_requires:
  - bits-recipe-tools
license: Apache-2.0 WITH LLVM-exception
---
#!/bin/bash -e
##############################
. $(bits-include CMakeRecipe)
##############################
MODULE_OPTIONS="--bin --lib"
##############################
function Configure() {
  bash -c "bash # (lcgcmake-internal script removed) ${clang_build_option} \ -DCMAKE_BUILD_TYPE=Release \ -DLLVM_BUILD_LLVM_DYLIB=ON \ -DLLVM_LINK_LLVM_DYLIB:BOOL=ON \ -DLLVM_ENABLE_ASSERTIONS=OFF \ -DLLVM_ENABLE_RTTI=ON \ -DLLVM_INCLUDE_EXAMPLES=OFF \ -DCMAKE_INSTALL_PREFIX=$INSTALLROOT $SOURCEDIR/llvm/ \ -DLLVM_BINUTILS_INCDIR=${binutils_ROOT}/include"
}