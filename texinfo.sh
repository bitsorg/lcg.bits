package: texinfo
description: GNU Texinfo documentation system
version: "7.2"
source: https://git.savannah.gnu.org/git/texinfo.git
tag: "v%(version)s"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/%(name)s-%(version)s.tar.gz
# macOS: source texinfo from Homebrew (texinfo) — GNU texinfo (makeinfo) build/doc tool. prefer_system gated
# osx.* so Linux keeps building from source below.
prefer_system: "osx.*"
homebrew_formula: texinfo
prefer_system_check: |
  #!/bin/bash
  # Only runs on macOS (osx.* gate). Install on demand with `bits --brew`;
  # otherwise HomebrewRecipe reports the missing formula at build time.
  if [ "${BITS_BREW:-}" = "1" ] && ! brew --prefix texinfo >/dev/null 2>&1; then
    brew install texinfo >&2 || true
  fi
  echo "bits_system_replace: texinfo"
prefer_system_replacement_specs:
  texinfo:
    version: "homebrew"
    build_requires:
      - bits-recipe-tools
    recipe: |
      #!/bin/bash -e
      MODULE_OPTIONS="--bin --lib"
      HOMEBREW_FORMULA=texinfo
      . $(bits-include HomebrewRecipe)
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: GPL-3.0-or-later
---
#!/bin/bash -e
##############################
. $(bits-include AutoToolsRecipe)
##############################
MODULE_OPTIONS="--bin --lib"
##############################
