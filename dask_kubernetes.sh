package: dask_kubernetes
description: dask_kubernetes Python package
version: "2025.7.0"
tag: "2025.7.0"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/dask-kubernetes-2025.7.0).tar.gz
requires:
  - Python
  - setuptools
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
license: TODO
---
#!/bin/bash -e
##############################
. $(bits-include PythonRecipe)
##############################
MODULE_OPTIONS="--python"
##############################