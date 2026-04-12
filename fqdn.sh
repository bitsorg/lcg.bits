package: fqdn
description: fqdn Python package
version: "1.5.1"
tag: "1.5.1"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/fqdn-1.5.1.tar.gz
requires:
  - Python
  - pip
  - arrow
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