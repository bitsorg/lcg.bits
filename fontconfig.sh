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
# macOS sources fontconfig from Homebrew (see HomebrewRecipe / `bits brew`);
# Linux is unaffected — prefer_system is gated to osx.* so the recipe below
# still builds from source there.
prefer_system: "osx.*"
homebrew_formula: fontconfig
prefer_system_check: |
  #!/bin/bash
  # Only runs on macOS (osx.* gate). Install on demand with `bits --brew`;
  # otherwise HomebrewRecipe reports the missing formula at build time.
  if [ "${BITS_BREW:-}" = "1" ] && ! brew --prefix fontconfig >/dev/null 2>&1; then
    brew install fontconfig >&2 || true
  fi
  echo "bits_system_replace: fontconfig"
prefer_system_replacement_specs:
  fontconfig:
    version: "homebrew"
    build_requires:
      - bits-recipe-tools
    recipe: |
      #!/bin/bash -e
      MODULE_OPTIONS="--bin --lib --pkgconfig"
      HOMEBREW_FORMULA=fontconfig
      . $(bits-include HomebrewRecipe)
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: MIT
---
#!/bin/bash -e
##############################
. $(bits-include AutoToolsRecipe)
. $(bits-include BitsArch)
##############################
MODULE_OPTIONS="--bin --lib --pkgconfig"
##############################
function Configure() {
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
  _triple=$(bits_triple)
  for _dir in "/usr/lib/${_triple}/pkgconfig" "/usr/lib/pkgconfig" "/usr/share/pkgconfig"; do
    if [ -f "${_dir}/freetype2.pc" ]; then
      cp "${_dir}/freetype2.pc" "${INSTALLROOT}/lib/pkgconfig/freetype2.pc"
      return 0
    fi
  done
}
