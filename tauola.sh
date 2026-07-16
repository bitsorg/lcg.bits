package: tauola
description: TAUOLA Monte Carlo generator for tau lepton decays
version: "28.121.2"
source: https://github.com/Malexandra-de/Tauolapp
tag: "v%(version)s"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/MCGeneratorsTarFiles/tauola-28.121.2-src.tgz
requires:
  - photos
  - pythia6
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: LicenseRef-TAUOLA
patches:
  - tauola-28.121.2.patch
---
#!/bin/bash -e
##############################
. $(bits-include AutoToolsRecipe)
. $(bits-include BitsMacOS)
##############################
MODULE_OPTIONS="--bin --lib"
##############################
function Prepare() {
  rsync -av --delete --exclude '**/.git' --delete-excluded "${SOURCEDIR}"/ ./
  # configure does `ARCH=$(uname)` → "Linux" → FC=g77 (GCC 3.x, gone).
  # Redirect "Linux" to "Linux-gcc4" so the gfortran branch is taken instead,
  # and fix the obsolete FLIBS while we're here.
  perl -i -pe \
    's/^export ARCH="`uname`"$/export ARCH="`uname`"\n[ "\$ARCH" = Linux ] && ARCH=Linux-gcc4/; s/export FLIBS="-lfrtbegin -lg2c"/export FLIBS="-lgfortran"/' \
    configure
}

function Configure() {
  export COMPMODE=OPT
  ./configure --prefix="$INSTALLROOT" --datadir="$INSTALLROOT/data"
}

function Make() {
  # macOS: configure's ARCH=Darwin picks legacy FC=g77/CC=gcc, and clang's `-M file.F` dep
  # rule fails on Fortran. Point FC/CC at gfortran and rewrite Makeshared.subdir's ELF
  # shared-link to Mach-O (idempotent via the grep guard).
  local _cc=()
  if bits_is_macos; then
    # Rewrite Makeshared.subdir's ELF shared-link (-shared -Wl,-soname, which
    # Apple ld rejects) to Mach-O (-dynamiclib + dynamic_lookup + headerpad).
    bits_file_sub Makeshared.subdir '-shared -Wl,-soname,\$\(notdir \$\@\)' \
      '-dynamiclib -Wl,-undefined,dynamic_lookup -Wl,-headerpad_max_install_names'
    # clang infers Fortran for .F and fails the `$(CC) -M` dep step; point CC at
    # gfortran (-ffixed-line-length-132 to match the source layout).
    _cc=(FC=gfortran "CC=gfortran -ffixed-line-length-132")
  fi
  # GCC 15 rejects rank mismatches (scalar IDUM passed where DADMPI/DADMKK
  # expect a rank-1 array for 'hv') that older compilers silently accepted.
  make ${JOBS:+-j $JOBS} "${_cc[@]}" \
    FFLAGS_tauola="-O2 -Wuninitialized -fno-automatic -ffixed-line-length-132 -fno-backslash -fno-second-underscore -fallow-argument-mismatch"
}

function MakeInstall() {
  # Replace tauola's fragile upstream `install` target (a backslash-continued
  # shell `if…fi` with `#` comments inside that /bin/sh mis-parses). Install the
  # same tree directly: config.mk + headers + libs, static archives symlinked into lib/.
  mkdir -p "$INSTALLROOT"
  cp -rf config.mk include lib "$INSTALLROOT/"
  ( cd "$INSTALLROOT/lib" && ls -1 archive/*.a 2>/dev/null | xargs -n 1 ln -sf ) || true
}
