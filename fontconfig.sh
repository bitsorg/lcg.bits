package: fontconfig
description: Fontconfig font configuration and customization library
version: "2.14.2"
source: https://gitlab.freedesktop.org/fontconfig/fontconfig
tag: "%(version)s"
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
  # freetype is prefer_system, so freetype2.pc sits at an OS multiarch path not on
  # bits' PKG_CONFIG_PATH; copy it into our lib/pkgconfig so downstream consumers
  # of fontconfig.pc (pango/harfbuzz/cairo) can resolve "Requires: freetype2".
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
