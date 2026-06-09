package: epos4
description: EPOS4 hadronic interaction and heavy-ion event generator
version: "4.0.3.atlas1"
tag: "4.0.3.atlas1"
sources:
  # Upstream tarball is named for the base version (4.0.3); the ".atlas1" suffix
  # is only the LCG version label, not part of the filename.  In lcgcmake this
  # comes from "author=4.0.3" in the epos4 package declaration, giving
  # epos<author>.tgz = epos4.0.3.tgz.
  - https://lcgpackages.web.cern.ch/tarFiles/sources/MCGeneratorsTarFiles/epos4.0.3.tgz
requires:
  - CMake
  - ROOT
  - fastjet
  - hepmc3
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: LicenseRef-EPOS4
patches:
  - epos4-4.0.3.atlas1.patch
---
#!/bin/bash -e
##############################
. $(bits-include CMakeRecipe)
##############################
MODULE_OPTIONS="--bin --lib"
##############################
function Configure() {
  # macOS: gated off. EPOS4's static COMMON blocks total more than 4 GB; on
  # x86_64 that is addressed with -mcmodel=large, but arm64 gfortran has not
  # implemented the large code model ("f951: sorry, unimplemented: code model
  # 'large'"), so the default (small) model is the only option and its ADRP
  # ±4 GB reach cannot span the COMMON section: the final link of libepos.dylib
  # /Xepos fails with "ld: fixup error (arm64_was_adrp_ldr_got_elide_got) ...
  # ADRP out of range ... ('_files_')". The GNU-ld -Wl,--no-relax that suppresses
  # the equivalent GOT-elision has no Apple-ld counterpart. No toolchain flag
  # makes >4 GB of static Fortran COMMON addressable on Apple Silicon today.
  # EPOS4 is a leaf package (no dependents), so produce an empty package on
  # Darwin; remove the guards here and in Make/MakeInstall/PostInstall to resume
  # the port (e.g. once arm64 gfortran gains a large code model, or after
  # shrinking COMMON). Everything below builds cleanly up to that final link.
  # Linux is unchanged.
  [ "$(uname)" = Darwin ] && { mkdir -p "$INSTALLROOT"; return 0; }
  # EPOS4's CMake applies its Fortran flag set (FORTRAN_COMPILE_FLAGS: -cpp,
  # -std=legacy, -mcmodel=large, -fno-automatic, ...) to the TP/UR/HQ targets via
  # target_compile_options, but NOT to the KW target (src/KW only gets -D__ROOT__
  # added to the list, never applied). So KW's huge legacy file src/KW/bas.f
  # compiles WITHOUT -cpp: its `#include "ems.h"` / `#if __TP__` are never
  # preprocessed, leaving parameters like kollmx undefined ("Automatic object ...
  # cannot appear in COMMON", "Variable 'kollmx' cannot appear in the
  # expression"), and without -std=legacy/-mcmodel=large. Inject the full set via
  # CMAKE_Fortran_FLAGS, which DOES reach every Fortran target (KW included). Also
  # add -fallow-argument-mismatch for the legacy REAL(8)/REAL(4) call mismatches
  # (gfortran >= 10 errors on these; the project never adds it). Modules that
  # already get these flags just receive them twice, which is harmless.
  #
  # -mcmodel=large is x86_64-only here: EPOS's huge static COMMON blocks need the
  # large code model on Linux/x86_64, but arm64 gfortran has not implemented it
  # ("f951: sorry, unimplemented: code model 'large' not supported yet"), and it
  # would fail CMake's Fortran compiler-detection TryCompile before any EPOS file
  # is built. AArch64's default (small) code model addresses static data via
  # ADRP/GOT and handles EPOS's COMMON blocks without it, so drop it on arm64.
  local _fflags="-fallow-argument-mismatch -cpp -std=legacy -fno-automatic"
  [ "$(uname -m)" != arm64 ] && _fflags="$_fflags -mcmodel=large"
  # macOS has no <malloc.h>; malloc lives in <stdlib.h>. src/KWb/time.c is the
  # only file that includes it, and it only uses ftime/times (not malloc), so
  # <stdlib.h> is a safe portable replacement. Idempotent; Linux keeps malloc.h.
  [ "$(uname)" = Darwin ] && perl -i -pe 's{^#include <malloc\.h>}{#include <stdlib.h>}' \
    "${SOURCEDIR}/src/KWb/time.c"
  # EPOS links the epos/Xepos targets with -Wl,--no-relax (GNU ld linker-
  # relaxation control). Apple's ld does not implement it ("ld: unknown options:
  # --no-relax") and there is no equivalent or need on arm64, so strip it from
  # the two set_target_properties LINK_FLAGS lines on Darwin. Linux keeps it.
  [ "$(uname)" = Darwin ] && perl -i -pe 's/-Wl,--no-relax//g' "${SOURCEDIR}/CMakeLists.txt"
  cmake "${SOURCEDIR}" \
      -DCMAKE_INSTALL_PREFIX="${INSTALLROOT}" \
    ${CMAKE_PREFIX_PATH:+-DCMAKE_PREFIX_PATH="${CMAKE_PREFIX_PATH}"} \
      -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_Fortran_FLAGS="$_fflags" \
    -DCOMPILE_OPTION=BASIC \
    -DCOMPILE_LIBRARY=ON \
    -DFASTSYS="${FASTJET_ROOT}" \
    -DCMAKE_POSITION_INDEPENDENT_CODE=ON
}
function Make() {
  # macOS: gated off (see Configure).
  [ "$(uname)" = Darwin ] && return 0
  cmake --build . -- ${CMAKE_OPTIONS} ${JOBS:+-j$JOBS}
}
function MakeInstall() {
  # macOS: gated off (see Configure).
  [ "$(uname)" = Darwin ] && return 0
  cmake --install .
}
function PostInstall() {
  # macOS: gated off (see Configure) - no build artefacts or runtime env to set.
  [ "$(uname)" = Darwin ] && return 0
  # Copy data files (excluding source and build artefacts)
  rsync -a \
    --exclude='**/CMakeModules' \
    --exclude=CMakeLists.txt \
    --exclude='**/.git' \
    --exclude='*.h' \
    --exclude='*.c' \
    --exclude='*.cpp' \
    --exclude='*.f' \
    "$SOURCEDIR"/ "$INSTALLROOT"/
  # Extend modulefile with EPOS4 runtime environment
  cat >> "$INSTALLROOT/etc/modulefiles/$PKGNAME" << 'EOF'
setenv EPOS4_ROOT $PKG_ROOT
setenv EPO4VSN 4.0.3
# Final slash is required by EPOS, please leave it be
setenv EPO4 $PKG_ROOT/
prepend-path PATH $::env(EPO4)bin
setenv OPT ./
setenv HTO ./
setenv CHK ./
EOF
}
