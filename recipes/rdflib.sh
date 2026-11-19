package: rdflib
description: RDFLib Python library for RDF graph manipulation
version: "6.1.1"
tag: "6.1.1"
requires:
  - Python
  - isodate
  - pyparsing
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: BSD-3-Clause
---
#!/bin/bash -e
##############################
. $(bits-include PythonPipRecipe)
##############################
MODULE_OPTIONS="--bin --python"
##############################