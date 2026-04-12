package: cudnn
description: cudnn library/tool (from LCG software stack)
version: "8.2.4.15"
tag: "8.2.4.15"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/internal/cudnn-${CUDA_OS_NAME}-${CUDNN_ARCH}-8.2.4.15_cuda<cudnn_8.2.4.15_cuda>-archive.tar.xz
requires:
  - cuda
build_requires:
  - bits-recipe-tools
license: TODO
---
#!/bin/bash -e
##############################
. $(bits-include BinaryRecipe)
##############################
