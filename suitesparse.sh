package: suitesparse
description: SuiteSparse sparse matrix algorithms collection
version: "5.10.1"
tag: "5.10.1"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/%(name)s-%(version)s.tar.gz
requires:
  - blas
  - mpfr
  - gmp
# macOS: source suitesparse from Homebrew (suite-sparse) — SuiteSparse sparse-matrix suite (no consumers). prefer_system gated
# osx.* so Linux keeps building from source below.
prefer_system: "osx.*"
homebrew_formula: suite-sparse
prefer_system_check: |
  #!/bin/bash
  # Only runs on macOS (osx.* gate). Install on demand with `bits --brew`;
  # otherwise HomebrewRecipe reports the missing formula at build time.
  if [ "${BITS_BREW:-}" = "1" ] && ! brew --prefix suite-sparse >/dev/null 2>&1; then
    brew install suite-sparse >&2 || true
  fi
  echo "bits_system_replace: suitesparse"
prefer_system_replacement_specs:
  suitesparse:
    version: "homebrew"
    build_requires:
      - bits-recipe-tools
    recipe: |
      #!/bin/bash -e
      MODULE_OPTIONS="--bin --lib"
      HOMEBREW_FORMULA=suite-sparse
      . $(bits-include HomebrewRecipe)
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: BSD-3-Clause
patches:
  - suitesparse-5.10.1.patch
---
#!/bin/bash -e
##############################
. $(bits-include MakeRecipe)
##############################
MODULE_OPTIONS="--bin --lib"
##############################
function Make() {
  # Disable GPU/CUDA in CHOLMOD: 5.10.1 GPU source has typos (addUpateOnDevice)
  # and a wrong cudaStream_t pointer level that break compilation when CUDA
  # headers are present. Anchor on -DGPU_BLAS (may sit in indented ifeq blocks).
  find . -name "*.mk" -print0 | xargs -0 perl -i -pe 's/ *-DGPU_BLAS//g'
  local _inc="${MPFR_ROOT:+-I${MPFR_ROOT}/include} ${GMP_ROOT:+-I${GMP_ROOT}/include}"
  local _libs="-L${INSTALLROOT}/lib ${MPFR_ROOT:+-L${MPFR_ROOT}/lib} ${GMP_ROOT:+-L${GMP_ROOT}/lib}"
  local _blas="${BLAS_ROOT:+-L${BLAS_ROOT}/lib} -lopenblas"
  make ${JOBS:+-j $JOBS} ${CC:+CC=$CC} ${_inc:+CFLAGS="$_inc"} ${_libs:+LDFLAGS="$_libs"}
  make ${JOBS:+-j $JOBS} install ${CC:+CC=$CC} ${_inc:+CFLAGS="$_inc"} ${_libs:+LDFLAGS="$_libs"} \
    INSTALL_LIB=$INSTALLROOT/lib \
    INSTALL_INCLUDE=$INSTALLROOT/include \
    BLAS="$_blas" LAPACK="$_blas"
}
function MakeInstall() { true; }
