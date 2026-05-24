package: fontconfig
description: Fontconfig font configuration and customization library
version: "2.14.2"
tag: "2.14.2"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/%(name)s-%(version)s.tar.gz
requires:
  - freetype
  - gperf
  - expat
  - pkg_config
  - uuid
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
  export PKG_CONFIG_PATH="${FREETYPE_ROOT}/lib/pkgconfig:${EXPAT_ROOT}/lib/pkgconfig:${UUID_ROOT}/lib/pkgconfig${PKG_CONFIG_PATH:+:${PKG_CONFIG_PATH}}"
  ./configure --disable-docs --prefix="${INSTALLROOT}"
}
