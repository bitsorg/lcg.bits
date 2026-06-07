package: iwyu
description: Include-What-You-Use C/C++ header analysis tool
# IWYU is tied to the Clang/LLVM major version: 0.18 targets Clang 16, but this
# stack ships Clang 20 (the 0.18 build failed with classof-ambiguous LLVM API
# errors). 0.24 is the release for Clang 20.
version: "0.24"
tag: "0.24"
sources:
  # The LCG mirror only carries older IWYU drops (LCG_109 ships 0.18 for its
  # Clang). This stack needs 0.24 for Clang 20, which is not on the mirror, so
  # fetch the 0.24 release tarball from upstream instead.
  - https://github.com/include-what-you-use/include-what-you-use/archive/refs/tags/%(version)s.tar.gz
requires:
  - CMake
  - Clang
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: LLVM-exception
---
#!/bin/bash -e
##############################
. $(bits-include CMakeRecipe)
##############################
MODULE_OPTIONS="--bin --lib"
##############################
