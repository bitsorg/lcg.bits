package: QKeras
description: QKeras Python package
version: "0.9.0"
tag: "0.9.0"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/QKeras-0.9.0.tar.gz
requires:
  - Python
  - setuptools
  - tensorflow_model_optimization
  - tqdm
  - scipy
  - scikitlearn
  - pyparser
  - numpy
  - networkx
  - keras_tuner
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