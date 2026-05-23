package: hyperopt
description: Hyperopt distributed hyperparameter optimization
version: "0.2.8"
tag: "0.2.8"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/%(name)s-%(version)s.tar.gz
requires:
  - Python
  - cloudpickle
  - networkx
  - numpy
  - py4j
  - scipy
  - six
  - tqdm
  - arrow
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: BSD-3-Clause
---
#!/bin/bash -e
##############################
. $(bits-include PythonRecipe)
##############################
MODULE_OPTIONS="--bin --python"
##############################