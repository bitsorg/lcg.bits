package: cuda
description: NVIDIA CUDA parallel computing platform and API
version: "11.4"
tag: "11.4"
requires:
  - CMake
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: LicenseRef-NVIDIA-CUDA
---
#!/bin/bash -e
##############################
. $(bits-include CMakeRecipe)
##############################
MODULE_OPTIONS="--bin --lib"
##############################
function Make() {
  cmake -E make_directory -p $BUILDDIR/cuda/tmp
  $SOURCEDIR/cuda_<cuda_11.4_full>_linux${CUDA_ARCH_NAME} --silent         # disable interactive prompts --override       # override compiler version checks --toolkit        # install CUDA Toolkit --toolkitpath=$INSTALLROOT
}
