package: horovod
description: Horovod distributed deep learning training framework
version: "0.28.1"
tag: "0.28.1"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/%(name)s-%(version)s.tar.gz
requires:
  - Python
  - openmpi
  - cloudpickle
  - psutil
  - PyYAML
  - packaging
  # optional:
  # - torch
  # - keras
  # - libuv
  # - sympy
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: Apache-2.0
patches:
  - horovod-0.28.1.patch
---
#!/bin/bash -e
##############################
. $(bits-include PythonRecipe)
##############################
MODULE_OPTIONS="--bin --python"
##############################
function Configure() {
  # third_party/gloo ships with cmake_minimum_required(VERSION 2.8.12); CMake
  # 3.27+ removed backward compat with VERSION < 3.5 and hard-errors on it.
  # Bump all VERSION 2.x lines in gloo's CMakeLists.txt to 3.5.
  find third_party/gloo -name CMakeLists.txt \
    -exec perl -i -pe 's/cmake_minimum_required(VERSION 2\.[0-9.]*/cmake_minimum_required(VERSION 3.5/' {} \;

  # Point horovod's internal cmake at the bits openmpi so FindMPI succeeds.
  # OPAL_PREFIX overrides openmpi's compiled-in prefix for the wrapper scripts.
  export MPI_HOME="${OPENMPI_ROOT}"
  export OPAL_PREFIX="${OPENMPI_ROOT}"
  export MPICC="${OPENMPI_ROOT}/bin/mpicc"
  export MPICXX="${OPENMPI_ROOT}/bin/mpicxx"

  # Propagate cmake policy workaround into horovod's internal cmake invocation.
  export CMAKE_ARGS="${CMAKE_ARGS:+${CMAKE_ARGS} }-DCMAKE_POLICY_VERSION_MINIMUM=3.5"
}