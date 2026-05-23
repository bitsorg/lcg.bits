package: hyperopt
description: Hyperopt distributed hyperparameter optimization
version: "0.2.8"
tag: "0.2.8"
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
. $(bits-include PythonPipRecipe)
##############################
MODULE_OPTIONS="--bin --python"
##############################