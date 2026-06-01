package: torch_cluster
description: torch-cluster methods for clustering in point clouds
version: "1.6.3p1"
tag: "1.6.3p1"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/%(name)s-%(version)s.tar.gz
requires:
  - Python
  - torch
  - sympy
  - scipy
  # CUDA (conditional: only --defaults cuda builds, arch tagged -cuda):
  - "cuda:.*-cuda$"
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: MIT
patches:
  - torch_cluster-1.6.3p1.patch
---
#!/bin/bash -e
##############################
. $(bits-include PythonRecipe)
##############################
MODULE_OPTIONS="--bin --python"
##############################