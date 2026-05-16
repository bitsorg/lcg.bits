package: rdflib
description: RDFLib Python library for RDF graph manipulation
version: "6.1.1"
tag: "6.1.1"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/rdflib-6.1.1.tar.gz
requires:
  - Python
  - setuptools
  - isodate
  - pyparsing
build_requires:
  - bits-recipe-tools
license: BSD-3-Clause
---
#!/bin/bash -e
##############################
. $(bits-include PythonRecipe)
##############################
MODULE_OPTIONS="--python"
##############################