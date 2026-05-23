package: nltk
description: NLTK Natural Language Toolkit for Python
version: "3.8.1"
tag: "3.8.1"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/%(name)s-%(version)s.zip
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
. $(bits-include PythonRecipe)
##############################
MODULE_OPTIONS="--bin --python"
##############################