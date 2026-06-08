package: gosam_contrib
description: GoSam contrib package for automated one-loop calculations
version: "2.0-20200904"
tag: "2.0-20200904"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/MCGeneratorsTarFiles/gosam-contrib-2.0-20200904.tar.gz
requires:
  - looptools
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
  # macOS: the bundled libtool computes _lt_dar_allow_undefined from a
  # MACOSX_DEPLOYMENT_TARGET version case whose last branch is `10.*)`. On
  # modern macOS the target is 14.0, which matches no branch, so the variable
  # is left empty and the dylib link (gcc -dynamiclib, e.g. libgolem) carries
  # no -undefined flag. golem95's Fortran objects then leave libgfortran
  # runtime symbols (__gfortran_concat_string, __gfortran_matmul_c8, ...)
  # undefined, which macOS's two-level namespace rejects ("symbol(s) not found
  # for architecture arm64"). Linux's flat namespace resolves them at runtime.
  # Widen that final branch `10.*)` -> `*)` so any modern target selects
  # `-undefined dynamic_lookup`, restoring the Linux behaviour. Targeted to the
  # branch immediately preceding the dynamic_lookup assignment so the other
  # `10.*)` version checks in configure are untouched. Linux is unaffected.
  if [ "$(uname)" = Darwin ]; then
    perl -0777 -i -pe \
      's/(\n\s+)10\.\*\)(\n\s+_lt_dar_allow_undefined='"'"'\$wl-undefined \$\{wl\}dynamic_lookup'"'"')/${1}*)${2}/g' \
      configure
  fi
  ./configure --prefix=$INSTALLROOT \
    "F77=${FC:-gfortran}" \
    "FC=${FC:-gfortran}" \
    "FFLAGS=-std=legacy -fallow-argument-mismatch" \
    "FCFLAGS=-std=legacy -fallow-argument-mismatch"
  # ninja-1.2.0/Makefile lists Fortran .mod files as prerequisites of all-am
  # for installation, but automake --tag=FC only emits rules for .lo object
  # files — .mod files are produced as silent side effects of FC compilation
  # and have no explicit make rule.  Add no-op rules so make can resolve them.
  {
    printf '\nninjago_module.mod: ninjago.lo\n\t@:\n'
    printf '\nquadninjago_module.mod: quadsources/ninjago.lo\n\t@:\n'
    printf '\nninjavholo.mod: ninjavholo.lo\n\t@:\n'
    printf '\nmninja.mod: mninja.lo\n\t@:\n'
  } >> ninja-1.2.0/Makefile
}

function Make() {
  # macOS: patch the *generated* libtool scripts, not just configure. On an
  # incremental/resumed build bits does not re-run Configure, so the
  # configure-time widening of _lt_dar_allow_undefined above never executes and
  # the libtool scripts produced by the first (pre-fix) configure still carry
  # allow_undefined_flag="" — the MACOSX_DEPLOYMENT_TARGET version case left it
  # empty for target 14.0. The libgolem dylib link (gcc -dynamiclib, --tag=CC)
  # then omits -undefined dynamic_lookup and macOS's two-level namespace rejects
  # the libgfortran runtime symbols (__gfortran_concat_string, ...). Patching
  # every generated libtool here applies the fix whether or not configure
  # re-ran. Idempotent; Linux has no such libtool scripts to match.
  if [ "$(uname)" = Darwin ]; then
    find . -name libtool -type f -exec perl -i -pe \
      's/^allow_undefined_flag=""\s*$/allow_undefined_flag="-undefined dynamic_lookup"/' {} +
  fi
  make ${JOBS:+-j $JOBS}
}
