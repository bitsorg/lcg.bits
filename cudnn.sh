package: cudnn
description: NVIDIA cuDNN deep learning GPU primitive library
version: "8.2.4.15"
tag: "8.2.4.15"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/internal/cudnn-${CUDA_OS_NAME}-${CUDNN_ARCH}-8.2.4.15_cuda<cudnn_8.2.4.15_cuda>-archive.tar.xz
requires:
  - cuda
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: LicenseRef-NVIDIA-cuDNN
# NVIDIA cuDNN EULA: only permitted runtime files are redistributable, the full package is not (2026-07-20 license ruling): build and private-store reuse are
# fine, but this package must never be laid into a public CVMFS tree.
redistributable: none
---
#!/bin/bash -e
##############################
. $(bits-include BinaryRecipe)
##############################
MODULE_OPTIONS="--bin --lib --inc"
##############################
