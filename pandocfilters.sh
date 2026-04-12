package: pandocfilters
description: pandocfilters Python package
version: "1.5.1"
tag: "1.5.1"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/pandocfilters-1.5.1.tar.gz
requires:
  - Python
  - setuptools
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