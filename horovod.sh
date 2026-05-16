package: horovod
description: Horovod distributed deep learning training framework
version: "0.28.1"
tag: "0.28.1"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/horovod-0.28.1.tar.gz
requires:
  - cloudpickle
  - psutil
  - PyYAML
  - packaging
  - pip
  # optional:
  # - torch
  # - keras
  # - libuv
  # - sympy
build_requires:
  - bits-recipe-tools
license: Apache-2.0
patches:
  - horovod-0.28.1.patch
---
#!/bin/bash -e
##############################
. $(bits-include PythonRecipe)
##############################
MODULE_OPTIONS="--python"
##############################