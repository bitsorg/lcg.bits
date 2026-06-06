package: julia
description: Julia high-performance dynamic programming language
version: "1.11.6"
tag: "1.11.6"
sources:
  # Linux-only prebuilt tarball (x86-64). Gated to non-osx so macOS does not
  # grab the wrong-OS/arch binary; macOS sources Julia from Homebrew below.
  - "((?!osx).*)https://lcgpackages.web.cern.ch/tarFiles/sources/julia-%(version)s-linux-x86_64.tar.gz"
# macOS: source Julia from Homebrew (formula julia). prefer_system gated osx.*
# so Linux keeps unpacking the prebuilt tarball above. julia self-locates its
# stdlib/sysimage from the real binary path, so the bin/lib/share symlinks
# HomebrewRecipe creates are sufficient.
prefer_system: "osx.*"
homebrew_formula: julia
prefer_system_check: |
  #!/bin/bash
  # Only runs on macOS (osx.* gate). Install on demand with `bits --brew`;
  # otherwise HomebrewRecipe reports the missing formula at build time.
  if [ "${BITS_BREW:-}" = "1" ] && ! brew --prefix julia >/dev/null 2>&1; then
    brew install julia >&2 || true
  fi
  echo "bits_system_replace: julia"
prefer_system_replacement_specs:
  julia:
    version: "homebrew"
    build_requires:
      - bits-recipe-tools
    recipe: |
      #!/bin/bash -e
      MODULE_OPTIONS="--bin --lib"
      HOMEBREW_FORMULA=julia
      . $(bits-include HomebrewRecipe)
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: MIT
---
#!/bin/bash -e
##############################
. $(bits-include BinaryRecipe)
##############################
MODULE_OPTIONS="--bin --lib"
##############################
