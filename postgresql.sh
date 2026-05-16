package: postgresql
description: PostgreSQL open-source relational database system
version: "17.5"
tag: "17.5"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/postgresql-17.5.tar.gz
requires:
  - bison
  - flex
  - m4
  - pkg_config
  - gettext
build_requires:
  - bits-recipe-tools
license: PostgreSQL
---
#!/bin/bash -e
##############################
. $(bits-include AutoToolsRecipe)
##############################
MODULE_OPTIONS="--bin --lib"
##############################
