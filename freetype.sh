package: freetype
description: FreeType scalable font rendering engine
version: "2.14.3"
tag: "2.14.3"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/%(name)s-%(version)s.tar.gz
requires:
  - zlib
prefer_system: ".*"
# macOS sources FreeType from Homebrew (see HomebrewRecipe / `bits brew`); Linux
# keeps the existing system-package check and the source build below.
homebrew_formula: freetype
prefer_system_check: |
  #!/bin/bash
  if bits_is_macos; then
    # Install on demand with `bits --brew`; otherwise HomebrewRecipe reports the
    # missing formula at build time.
    if [ "${BITS_BREW:-}" = "1" ] && ! brew --prefix freetype >/dev/null 2>&1; then
      brew install freetype >&2 || true
    fi
    echo "bits_system_replace: freetype"
    exit 0
  fi
  printf "#include <ft2build.h>\n" | c++ -xc++ - `freetype-config --cflags 2>/dev/null` `pkg-config freetype2 --cflags 2>/dev/null` -c -M 2>&1;
  if [ $? -ne 0 ]; then printf "FreeType is missing.\n * On RHEL-compatible systems: freetype freetype-devel\n * On Ubuntu-compatible systems: libfreetype6 libfreetype6-dev\n"; exit 1; fi
prefer_system_replacement_specs:
  freetype:
    version: "homebrew"
    build_requires:
      - bits-recipe-tools
    recipe: |
      #!/bin/bash -e
      MODULE_OPTIONS="--bin --lib --pkgconfig"
      HOMEBREW_FORMULA=freetype
      . $(bits-include HomebrewRecipe)

build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: FTL OR GPL-2.0-or-later
---
#!/bin/bash -e
##############################
. $(bits-include AutoToolsRecipe)
. $(bits-include BitsMacOS)
##############################
MODULE_OPTIONS="--bin --lib --pkgconfig"
##############################
function Configure() {
  ./configure --prefix $INSTALLROOT --with-pic --with-png=no --with-bzip2=no --with-harfbuzz=no CC=$CC CFLAGS=-O
}
