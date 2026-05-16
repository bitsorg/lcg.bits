package: jupyter_events
description: jupyter_events Jupyter event schema and logger
version: "0.10.0"
tag: "0.10.0"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/jupyter_events-0.10.0.tar.gz
requires:
  - Python
  - pip
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