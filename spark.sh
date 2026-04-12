package: spark
description: spark Python package
version: "4.1.1"
tag: "4.1.1"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/spark-4.1.1-bin-hadoop3.tgz
requires:
  - hadoop
  - Python
  - py4j
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