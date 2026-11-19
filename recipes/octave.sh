package: octave
description: GNU Octave high-level language for numerical computation
version: "10.3.0"
source: https://github.com/gnu-octave/octave
tag: "v%(version)s"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/%(name)s-%(version)s.tar.gz
requires:
  - pcre2
  - blas
  - Qt5
  - gnuplot
  - texinfo
# - readline
  - fftw
# macOS: source Octave from Homebrew (formula octave). Octave-from-source on macOS
# is a long, fragile build; its one consumer (octavekernel) just needs the binary.
# prefer_system gated osx.* so Linux keeps building 10.3.0 (brew is 11.x) from source.
prefer_system: "osx.*"
homebrew_formula: octave
prefer_system_check: |
  #!/bin/bash
  # Only runs on macOS (osx.* gate). Install on demand with `bits --brew` (pulls
  # a large brew dep tree); otherwise HomebrewRecipe reports the missing formula.
  if [ "${BITS_BREW:-}" = "1" ] && ! brew --prefix octave >/dev/null 2>&1; then
    brew install octave >&2 || true
  fi
  echo "bits_system_replace: octave"
prefer_system_replacement_specs:
  octave:
    version: "homebrew"
    build_requires:
      - bits-recipe-tools
    recipe: |
      #!/bin/bash -e
      MODULE_OPTIONS="--bin --lib"
      HOMEBREW_FORMULA=octave
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
function Configure() {
  export LDFLAGS="-L${BLAS_ROOT}/lib"
  export LIBS="-lopenblas"
 ./configure --prefix="${INSTALLROOT}" --with-blas=openblas --with-lapack=openblas --disable-readline --with-qt=5 --disable-rpath
}
