package: ipython
description: IPython interactive Python shell and kernel
version: "8.32.0"
tag: "8.32.0"
requires:
  - Python
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
. $(bits-include PythonPipRecipe)
##############################
MODULE_OPTIONS="--bin --python"
##############################