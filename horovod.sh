package: horovod
description: Horovod distributed deep learning training framework
version: "0.28.1"
source: https://github.com/horovod/horovod
tag: "v%(version)s"
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
  # third_party/gloo's cmake_minimum_required(2.8) hard-errors under CMake 4. Set
  # the policy floor via env var (honoured process-wide, incl. gloo); horovod's
  # setup.py doesn't forward CMAKE_ARGS to its internal cmake, so env is the only path.
  export CMAKE_POLICY_VERSION_MINIMUM=3.5

  # Point horovod's internal cmake at the bits openmpi so FindMPI succeeds.
  # OPAL_PREFIX overrides openmpi's compiled-in prefix for the wrapper scripts.
  export MPI_HOME="${OPENMPI_ROOT}"
  export OPAL_PREFIX="${OPENMPI_ROOT}"
  export MPICC="${OPENMPI_ROOT}/bin/mpicc"
  export MPICXX="${OPENMPI_ROOT}/bin/mpicxx"
}