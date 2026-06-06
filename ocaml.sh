package: ocaml
description: OCaml functional programming language compiler and standard library
version: "4.14.2"
tag: "4.14.2"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/%(name)s-%(version)s.tar.gz
# macOS: source OCaml from Homebrew (formula ocaml). prefer_system gated osx.*
# so Linux keeps building 4.14.2 from source below. NOTE: Homebrew ships OCaml
# 5.x, a major version above the pinned 4.14.2 — its only consumer (whizard) may
# need attention if its O'Mega/OCaml code is not 5.x-compatible.
prefer_system: "osx.*"
homebrew_formula: ocaml
prefer_system_check: |
  #!/bin/bash
  # Only runs on macOS (osx.* gate). Install on demand with `bits --brew`;
  # otherwise HomebrewRecipe reports the missing formula at build time.
  if [ "${BITS_BREW:-}" = "1" ] && ! brew --prefix ocaml >/dev/null 2>&1; then
    brew install ocaml >&2 || true
  fi
  echo "bits_system_replace: ocaml"
prefer_system_replacement_specs:
  ocaml:
    version: "homebrew"
    build_requires:
      - bits-recipe-tools
    recipe: |
      #!/bin/bash -e
      MODULE_OPTIONS="--bin --lib"
      HOMEBREW_FORMULA=ocaml
      . $(bits-include HomebrewRecipe)
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: LGPL-2.1-or-later WITH OCaml-LGPL-linking-exception
---
#!/bin/bash -e
##############################
. $(bits-include AutoToolsRecipe)
##############################
MODULE_OPTIONS="--bin --lib"
##############################
function Configure() {
  # Version >= 4.10.0: --disable-force-safe-string is supported
  ./configure --prefix $INSTALLROOT --disable-force-safe-string
}
function Make() {
  make ${JOBS:+-j $JOBS}
  make world.opt
}