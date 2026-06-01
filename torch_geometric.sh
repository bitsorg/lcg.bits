package: torch_geometric
description: PyTorch Geometric deep learning on graphs and other irregular structures
version: "2.6.1"
tag: "2.6.1"
requires:
  - torch
  - numpy
  - tqdm
  - scipy
  - networkx
  - scikitlearn
  - requests
  - pandas
  - pyparsing
  - PyYAML
  - Jinja2
  - torch_scatter
  - torch_sparse
  - rdflib
  - googledrivedownloader
  - yacs
  - psutil
  # CUDA (conditional: only --defaults cuda builds, arch tagged -cuda):
  - "cuda:.*-cuda$"
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: MIT
---
#!/bin/bash -e
##############################
. $(bits-include PythonPipRecipe)
##############################
MODULE_OPTIONS="--bin --python"
##############################