package: pytensor
description: PyTensor library for tensor computations (Theano successor)
version: "2.36.0"
source: https://github.com/pymc-devs/pytensor
tag: "rel-%(version)s"
# bits upgrade: no tarball of 2.36.0, built from the git tag
# sources:
#   - https://lcgpackages.web.cern.ch/tarFiles/sources/%(name)s-%(version)s.tar.gz
requires:
  - Python
  - cons
  - etuples
  - filelock
  - logical_unification
  - minikanren
  - numpy
  - scipy
  - typing_extensions
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: BSD-3-Clause
# patches:
#   - pytensor-2.35.1.patch
---
#!/bin/bash -e
##############################
. $(bits-include PythonPipRecipe)
##############################
MODULE_OPTIONS="--bin --python"
##############################
