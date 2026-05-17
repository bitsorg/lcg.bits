package: torch_geometric
description: PyTorch Geometric deep learning on graphs and other irregular structures
version: "2.6.1"
tag: "2.6.1"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/torch_geometric-2.6.1.tar.gz
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
  # optional:
  # - cuda
  - pip
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: MIT
---
#!/bin/bash -e
##############################
. $(bits-include PythonRecipe)
##############################
MODULE_OPTIONS="--bin --python"
##############################