package: theano
description: Theano Python library for efficient mathematical expressions on GPU
version: "unknown"
tag: "unknown"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/Theano-unknown.tar.gz
requires:
  - numpy
  - scipy
  - nose
  - pygments
  - graphviz
  - pydot
  - six
  - pydot_ng
build_requires:
  - bits-recipe-tools
license: BSD-3-Clause
---
#!/bin/bash -e
##############################
. $(bits-include PythonRecipe)
##############################
MODULE_OPTIONS="--python"
##############################