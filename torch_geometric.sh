package: torch_geometric
description: torch_geometric Python package
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
build_requires:
  - bits-recipe-tools
license: TODO
---
#!/bin/bash -e
##############################
. $(bits-include PythonRecipe)
##############################
MODULE_OPTIONS="--python"
##############################