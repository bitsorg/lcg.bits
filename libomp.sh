package: libomp
description: LLVM OpenMP runtime (libomp) — sourced from Homebrew on macOS
version: "1.0.0"
tag: "1.0.0"
# macOS only: Apple clang ships no OpenMP runtime, so consumers (gated "libomp:osx")
# source Homebrew's keg-only libomp here and get LIBOMP_ROOT. Never built on Linux,
# where GCC's libgomp provides OpenMP.
prefer_system: "osx.*"
homebrew_formula: libomp
prefer_system_check: |
  #!/bin/bash
  # Only runs on macOS (osx.* gate). Install on demand with `bits --brew`;
  # otherwise HomebrewRecipe reports the missing formula at build time.
  if [ "${BITS_BREW:-}" = "1" ] && ! brew --prefix libomp >/dev/null 2>&1; then
    brew install libomp >&2 || true
  fi
  echo "bits_system_replace: libomp"
prefer_system_replacement_specs:
  libomp:
    version: "homebrew"
    build_requires:
      - bits-recipe-tools
    recipe: |
      #!/bin/bash -e
      MODULE_OPTIONS="--lib --inc"
      HOMEBREW_FORMULA=libomp
      . $(bits-include HomebrewRecipe)
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: Apache-2.0
---
#!/bin/bash -e
##############################
. $(bits-include ModuleRecipe)
##############################
# Non-osx: libomp is never required here (consumers gate it "libomp:osx"; GCC
# provides libgomp). Emit an empty module so the recipe is valid on all
# architectures without building anything.
MODULE_OPTIONS="--lib"
function Build() {
  mkdir -p "$INSTALLROOT"
  MakeModule
}
