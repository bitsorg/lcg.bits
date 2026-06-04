package: dask_kubernetes
description: dask-kubernetes Dask deployment on Kubernetes
version: "2025.7.0"
tag: "2025.7.0"
requires:
  - Python
  - dask
  - distributed
  - kubernetes
  - PyYAML
  - kubernetes_asyncio
  - kopf
  - pykube_ng
  - rich
  - kr8s
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