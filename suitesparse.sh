package: suitesparse
description: SuiteSparse sparse matrix algorithms collection
version: "5.10.1"
tag: "5.10.1"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/%(name)s-%(version)s.tar.gz
requires:
  - blas
  - mpfr
  - gmp
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: BSD-3-Clause
patches:
  - suitesparse-5.10.1.patch
---
#!/bin/bash -e
##############################
. $(bits-include MakeRecipe)
##############################
MODULE_OPTIONS="--bin --lib"
##############################
function Make() {
  # GPU_BLAS_OPTION= disables CUDA/GPU support in CHOLMOD; the GPU source in
  # 5.10.1 has typos (addUpateOnDevice, wrong cudaStream_t pointer level) that
  # cause compilation errors when CUDA headers are present on the build host.
  local GPU_OFF="GPU_BLAS_OPTION="
  make ${JOBS:+-j $JOBS} ${CC:+CC=$CC} $GPU_OFF
  make ${JOBS:+-j $JOBS} install ${CC:+CC=$CC} $GPU_OFF \
    INSTALL_LIB=$INSTALLROOT/lib \
    INSTALL_INCLUDE=$INSTALLROOT/include \
    BLAS=-lopenblas LAPACK=-lopenblas
}
function MakeInstall() { true; }
