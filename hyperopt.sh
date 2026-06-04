package: hyperopt
description: Hyperopt distributed hyperparameter optimization
version: "0.2.7"
tag: "0.2.7"
requires:
  - Python
  - arrow
  - cloudpickle
  - networkx
  - numpy
  - py4j
  - scipy
  - six
  - tqdm
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
