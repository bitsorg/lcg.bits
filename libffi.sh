package: libffi
description: libffi portable foreign function interface library
version: "3.4.2"
tag: "3.4.2"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/%(name)s-%(version)s.tar.gz
# macOS: libffi 3.4.2's aarch64 sysv.S fails on Apple's assembler ("invalid CFI
# advance_loc expression"), so source it from Homebrew (libffi) instead — a very
# stable, low-level system library (macOS even ships one in the SDK). Consumers
# (cffi, glib, harfbuzz, pillow) link it via *_ROOT / PKG_CONFIG_PATH. Gated
# osx.* so Linux keeps building from source below.
prefer_system: "osx.*"
homebrew_formula: libffi
prefer_system_check: |
  #!/bin/bash
  # Only runs on macOS (osx.* gate). Install on demand with `bits --brew`;
  # otherwise HomebrewRecipe reports the missing formula at build time.
  if [ "${BITS_BREW:-}" = "1" ] && ! brew --prefix libffi >/dev/null 2>&1; then
    brew install libffi >&2 || true
  fi
  echo "bits_system_replace: libffi"
prefer_system_replacement_specs:
  libffi:
    version: "homebrew"
    build_requires:
      - bits-recipe-tools
    recipe: |
      #!/bin/bash -e
      MODULE_OPTIONS="--lib --pkgconfig"
      HOMEBREW_FORMULA=libffi
      . $(bits-include HomebrewRecipe)
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
  ./configure --prefix=$INSTALLROOT ${_libffi_opt}
}
