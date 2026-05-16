package: lazy_object_proxy
description: lazy-object-proxy fast and thorough lazy object proxy
version: "1.10.0"
tag: "1.10.0"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/lazy-object-proxy-1.10.0.tar.gz
requires:
  - Python
  - setuptools
  - pip
build_requires:
  - bits-recipe-tools
license: BSD-2-Clause
---
#!/bin/bash -e
##############################
. $(bits-include PythonRecipe)
##############################
MODULE_OPTIONS="--python"
##############################