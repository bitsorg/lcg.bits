package: pykube_ng
description: pykube_ng Python package
version: "23.6.0"
tag: "23.6.0"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/pykube_ng-23.6.0.tar.gz
requires:
  - Python
  - setuptools
  - pip
  - PyYAML
  - requests
  - urllib3
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