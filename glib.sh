package: glib
description: glib library/tool (from LCG software stack)
version: "2.76.2"
tag: "2.76.2"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/glib-2.76.2.tar.xz
requires:
  - libffi
  - pkg_config
  - gettext
  - looseversion
build_requires:
  - bits-recipe-tools
license: TODO
patches:
  - glib-2.76.2.patch
---
#!/bin/bash -e
##############################
. $(bits-include MesonRecipe)
##############################
MESON_EXTRA_OPTIONS="-Dlibmount=disabled -Dtests=false"
##############################
