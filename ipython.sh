package: ipython
description: IPython interactive Python shell and kernel
version: "8.32.0"
tag: "8.32.0"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/ipython-8.32.0.tar.gz
requires:
  - Python
  - pip
  - setuptools
  - ptyprocess
  - six
  - pexpect
  - traitlets
  - prompt_toolkit
  - pygments
  - jedi
  - decorator
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