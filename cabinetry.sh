package: cabinetry
description: cabinetry Python package
version: "0.5.2"
tag: "0.5.2"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/cabinetry-0.5.2.tar.gz
requires:
  - Python
  - setuptools
  - pip
  - awkward
  - boost_histogram
  - click
  - iminuit
  - jsonschema
  - matplotlib
  - numpy
  - packaging
  - pyhf
  - PyYAML
  - scipy
  - tabulate
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