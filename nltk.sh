package: nltk
description: NLTK Natural Language Toolkit for Python
version: "3.10.3"
tag: "3.10.3"
requires:
  - Python
  - click
  - joblib
  - regex
  - tqdm
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: Apache-2.0
---
#!/bin/bash -e
##############################
. $(bits-include PythonPipRecipe)
##############################
MODULE_OPTIONS="--bin --python"
##############################