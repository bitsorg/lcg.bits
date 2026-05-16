package: ruamel_yaml_clib
description: ruamel.yaml.clib C extension speedups for ruamel.yaml
version: "0.2.15"
tag: "0.2.15"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/ruamel.yaml.clib-0.2.15.tar.gz
requires:
  - Python
  - setuptools
  - pip
build_requires:
  - bits-recipe-tools
license: MIT
---
#!/bin/bash -e
##############################
. $(bits-include PythonRecipe)
##############################
MODULE_OPTIONS="--python"
##############################