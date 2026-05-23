package: scikit_hep
description: Scikit-HEP metapackage for HEP Python tools
version: "2026.2.1"
tag: "2026.2.1"
requires:
  - Python
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
  - "GCC-Toolchain:(?!osx)"
license: BSD-3-Clause
---
#!/bin/bash -e
##############################
. $(bits-include PythonPipRecipe)
##############################
MODULE_OPTIONS="--bin --python"
##############################