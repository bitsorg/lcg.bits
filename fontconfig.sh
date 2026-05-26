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
prepend_path:
  PKG_CONFIG_PATH: "$FONTCONFIG_ROOT/lib/pkgconfig"
---
#!/bin/bash -e
##############################
. $(bits-include AutoToolsRecipe)
##############################
MODULE_OPTIONS="--bin --lib --pkgconfig"
##############################
function Configure() {
  # Build pkg-config search path from available dep roots; fall back to common
  # system paths for packages that may be provided by the OS (e.g. freetype
  # when bits is invoked with --disable=freetype).
  local _pc=""
  for _root in "${FREETYPE_ROOT}" "${EXPAT_ROOT}" "${UUID_ROOT}"; do
    [ -n "${_root}" ] && _pc="${_pc:+${_pc}:}${_root}/lib/pkgconfig"
  done
  # Append system fallback paths for anything not found above.
  _pc="${_pc:+${_pc}:}/usr/lib/x86_64-linux-gnu/pkgconfig:/usr/lib/pkgconfig:/usr/share/pkgconfig"
  export PKG_CONFIG_PATH="${_pc}${PKG_CONFIG_PATH:+:${PKG_CONFIG_PATH}}"
  ./configure --disable-docs --prefix="${INSTALLROOT}"
}
