package: uproot_browser
description: uproot-browser TUI browser for ROOT files using uproot
version: "0.6.7"
tag: "0.6.7"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/uproot_browser-0.6.7.tar.gz
requires:
  - Python
  - awkward
  - click
  - hist
  - py_lz4
  - numpy
  - plotext
  - rich
  - textual
  - uproot
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