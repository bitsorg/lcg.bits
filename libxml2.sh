package: libxml2
description: GNOME XML parsing library
version: "2.10.4"
source: https://gitlab.gnome.org/GNOME/libxml2
tag: "v%(version)s"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/%(name)s-%(version)s.tar.gz
prefer_system: ".*"
prefer_system_check: |
  xml2-config --version;
  if [ $? -ne 0 ]; then printf "libxml2 not found.\n * On RHEL-compatible systems you probably need: libxml2 libxml2-devel\n * On Ubuntu-compatible systems you probably need: libxml2 libxml2-dev"; exit 1; fi

build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: MIT
---
#!/bin/bash -e
##############################
. $(bits-include AutoToolsRecipe)
##############################
MODULE_OPTIONS="--bin --lib --pkgconfig"
##############################
function Configure() {
  ./configure --prefix=$INSTALLROOT --without-python --without-lzma
}
