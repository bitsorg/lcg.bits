package: requests_unixsocket
description: requests-unixsocket Unix domain socket support for requests
version: "0.2.0"
tag: "0.2.0"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/requests-unixsocket-0.2.0.tar.gz
requires:
  - Python
  - setuptools
  - requests
  - urllib3
  - pbr
  - pip
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: MIT
---
#!/bin/bash -e
##############################
. $(bits-include PythonRecipe)
##############################
MODULE_OPTIONS="--bin --python"
##############################