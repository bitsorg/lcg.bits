package: theano
description: theano Python package
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
license: TODO
---
#!/bin/bash -e
##############################
. $(bits-include PythonRecipe)
##############################
MODULE_OPTIONS="--python"
##############################