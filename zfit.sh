package: zfit
description: zfit scalable Pythonic fitting library (HEP)
version: "0.28.0"
tag: "0.28.0"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/zfit-0.28.0.tar.gz
requires:
  - Python
  - pip
  - attrs
  - boost_histogram
  - colorama
  - colored
  - colorlog
  - deprecated
  - dill
  - dotmap
  - frozendict
  - hist
  - iminuit
  - jacobi
  - numdifftools
  - numpy
  - ordered_set
  - pandas
  - pydantic
  - PyYAML
  - scipy
  - tabulate
  - tensorflow
  - tensorflow_probability
  - texttable
  - typing_extensions
  - uhi
  - uproot
  - pyxxhash
  - zfit_interface
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: BSD-3-Clause
---
#!/bin/bash -e
##############################
. $(bits-include PythonRecipe)
##############################
MODULE_OPTIONS="--bin --python"
##############################