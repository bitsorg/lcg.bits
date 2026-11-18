package: cabinetry
description: cabinetry statistical model building and fitting (HEP)
version: "0.5.2"
tag: "0.5.2"
requires:
  - Python
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
  - "GCC-Toolchain:(?!osx)"
license: BSD-3-Clause
---
#!/bin/bash -e
##############################
. $(bits-include PythonPipRecipe)
##############################
MODULE_OPTIONS="--bin --python"
##############################