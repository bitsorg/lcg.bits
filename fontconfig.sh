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
  local _triple
  _triple=$(gcc -dumpmachine 2>/dev/null || echo "x86_64-linux-gnu")
  _pc="${_pc:+${_pc}:}/usr/lib/${_triple}/pkgconfig:/usr/lib/pkgconfig:/usr/share/pkgconfig"
  export PKG_CONFIG_PATH="${_pc}${PKG_CONFIG_PATH:+:${PKG_CONFIG_PATH}}"
  ./configure --disable-docs --prefix="${INSTALLROOT}"
}

function PostInstall() {
  # freetype has prefer_system, so its freetype2.pc lives at an OS multiarch
  # path (e.g. /usr/lib/x86_64-linux-gnu/pkgconfig/) that is NOT in bits'
  # PKG_CONFIG_PATH.  Every downstream pkg-config consumer of fontconfig.pc
  # (pango, harfbuzz, cairo, …) will fail resolving "Requires: freetype2"
  # unless freetype2.pc is reachable through a bits-managed pkgconfig dir.
  #
  # Solution: if freetype2.pc is not already accessible from FREETYPE_ROOT
  # (i.e. freetype is a system package), copy the system freetype2.pc into
  # our own lib/pkgconfig/.  Since $FONTCONFIG_ROOT/lib/pkgconfig is
  # prepended to PKG_CONFIG_PATH by the fontconfig module, every consumer
  # automatically finds freetype2 without any per-package workaround.
  [ -f "${INSTALLROOT}/lib/pkgconfig/freetype2.pc" ] && return 0
  [ -f "${FREETYPE_ROOT}/lib/pkgconfig/freetype2.pc" ] && return 0  # bits-built: already findable
  local _triple
  _triple=$(gcc -dumpmachine 2>/dev/null || echo "x86_64-linux-gnu")
  for _dir in "/usr/lib/${_triple}/pkgconfig" "/usr/lib/pkgconfig" "/usr/share/pkgconfig"; do
    if [ -f "${_dir}/freetype2.pc" ]; then
      cp "${_dir}/freetype2.pc" "${INSTALLROOT}/lib/pkgconfig/freetype2.pc"
      return 0
    fi
  done
}
