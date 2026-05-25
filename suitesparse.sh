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
  # Disable GPU/CUDA support in CHOLMOD: SuiteSparse 5.10.1 GPU source has
  # typos (addUpateOnDevice) and a wrong cudaStream_t pointer level that cause
  # compilation errors whenever CUDA headers are present on the build host.
  # GPU_BLAS_OPTION is defined in SuiteSparse_config.mk and read by recursive
  # sub-makes, so patching the file here is the only reliable way to disable it.
  sed -i 's/^GPU_BLAS_OPTION *=.*/GPU_BLAS_OPTION =/' \
    SuiteSparse_config/SuiteSparse_config.mk
  make ${JOBS:+-j $JOBS} ${CC:+CC=$CC}
  make ${JOBS:+-j $JOBS} install ${CC:+CC=$CC} \
    INSTALL_LIB=$INSTALLROOT/lib \
    INSTALL_INCLUDE=$INSTALLROOT/include \
    BLAS=-lopenblas LAPACK=-lopenblas
}
function MakeInstall() { true; }
