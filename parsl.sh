package: parsl
description: Parsl parallel scripting library for Python
version: "2026.01.05"
tag: "2026.01.05"
requires:
  - typeguard
  - ipyparallel
  - globus_sdk
  - dill
  - tblib
  - ipykernel
  - requests
  - paramiko
  - psutil
  - mpi4py
  - typing_extensions
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: Apache-2.0
---
#!/bin/bash -e
##############################
. $(bits-include PythonPipRecipe)
##############################
MODULE_OPTIONS="--bin --python"
##############################