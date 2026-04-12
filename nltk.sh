package: nltk
description: nltk Python package
version: "3.8.1"
tag: "3.8.1"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/nltk-3.8.1.zip
requires:
  - Python
  - pip
  - click
  - joblib
  - regex
  - tqdm
build_requires:
  - bits-recipe-tools
license: TODO
---
#!/bin/bash -e
##############################
. $(bits-include PythonRecipe)
##############################
MODULE_OPTIONS="--python"
##############################