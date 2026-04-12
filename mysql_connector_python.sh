package: mysql_connector_python
description: mysql_connector_python Python package
version: "9.4.0"
tag: "9.4.0"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/mysql_connector_python-9.4.0.tar.gz
requires:
  - Python
  - mysql
  - pip
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