package: hyperopt
description: hyperopt Python package
version: "0.2.8"
tag: "0.2.8"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/hyperopt-0.2.8.tar.gz
requires:
  - Python
  - pip
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
license: TODO
---
#!/bin/bash -e
##############################
. $(bits-include PythonRecipe)
##############################
MODULE_OPTIONS="--python"
##############################