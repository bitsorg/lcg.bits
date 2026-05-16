package: scikit_hep
description: Scikit-HEP metapackage for HEP Python tools
version: "2026.2.1"
tag: "2026.2.1"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/scikit_hep-2026.2.1.tar.gz
requires:
  - Python
  - pip
  - awkward
  - DecayLanguage
  - hepunits
  - hist
  - histoprint
  - iminuit
  - matplotlib
  - mplhep
  - numpy
  - particle
  - uproot
  - vector
  - hepstats
  - pylhe
  - resample
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