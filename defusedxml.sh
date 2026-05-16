package: defusedxml
description: defusedxml safe XML parsing (defense against XXE)
version: "0.7.1"
tag: "0.7.1"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/defusedxml-0.7.1.tar.gz
requires:
  - Python
  - setuptools
  - libxml2
build_requires:
  - bits-recipe-tools
license: PSFL
---
#!/bin/bash -e
##############################
. $(bits-include PythonRecipe)
##############################
MODULE_OPTIONS="--python"
##############################