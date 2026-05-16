package: DecayLanguage
description: DecayLanguage toolkit for decay descriptor parsing (HEP)
version: "0.20.0"
tag: "0.20.0"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/decaylanguage-0.20.0.tar.gz
requires:
  - Python
  - pip
  - setuptools
  - attrs
  - deprecated
  - graphviz_py
  - lark
  - numpy
  - pandas
  - particle
  - plumbum
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