package: tauola
description: TAUOLA Monte Carlo generator for tau lepton decays
version: "28.121.2"
tag: "28.121.2"
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
  # macOS: configure does ARCH=$(uname)="Darwin", which matches none of its
  # Linux / Linux-gcc4 branches, so it falls through to the legacy defaults
  # FC=g77 (gone) and CC=gcc. On macOS `gcc` is clang, and the dependency rule
  # `$(CC) -M file.F` makes clang infer Fortran for the `.F` extension and fail
  # ("invalid value 'f95' in '-x f95'"). There are no .c sources, so CC is used
  # only for that .F dependency step; point both FC and CC at gfortran (which
  # preprocesses `.F` and supports -M). Also rewrite the vendored shared-link
  # recipe in Makeshared.subdir from ELF conventions (`-shared -Wl,-soname`,
  # which macOS ld rejects) to Mach-O: -dynamiclib, allow the libgfortran
  # runtime symbols to resolve at load time (two-level namespace), and reserve
  # header pad for bits' install-name relocation. Linux is untouched: it takes
  # the gfortran branch via the configure ARCH redirect in Prepare() and keeps
  # the ELF link. Idempotent via the grep guard.
  local _cc=()
  if [ "$(uname)" = Darwin ]; then
    if ! grep -q 'dynamiclib' Makeshared.subdir; then
      perl -i -pe 's/-shared -Wl,-soname,\$\(notdir \$\@\)/-dynamiclib -Wl,-undefined,dynamic_lookup -Wl,-headerpad_max_install_names/g' \
        Makeshared.subdir
    fi
    # gfortran -M lexes the source, so the `$(CC) -M` dependency step also needs
    # -ffixed-line-length-132 or it truncates lines at column 72 and prints
    # spurious "Missing ')'" errors (those are swallowed by the .d rule, but
    # keep the log clean). CC is used only for that step (no .c sources).
    _cc=(FC=gfortran "CC=gfortran -ffixed-line-length-132")
  fi
  # GCC 15 rejects rank mismatches (scalar IDUM passed where DADMPI/DADMKK
  # expect a rank-1 array for 'hv') that older compilers silently accepted.
  make ${JOBS:+-j $JOBS} "${_cc[@]}" \
    FFLAGS_tauola="-O2 -Wuninitialized -fno-automatic -ffixed-line-length-132 -fno-backslash -fno-second-underscore -fallow-argument-mismatch"
}

function MakeInstall() {
  # tauola's upstream `install` make target wraps a multi-line shell `if … fi`
  # whose disabled lines are commented with `#` *inside* a backslash-continued
  # block. /bin/sh then treats the closing `fi` as part of the comment and
  # aborts ("syntax error: unexpected end of file") — fatal on macOS. Install
  # the same tree the active part of that rule produces, directly and portably:
  # config.mk + headers + libraries, with the static archives symlinked into
  # lib/. Replaces the fragile `make install` on every platform; the installed
  # tree is identical to the upstream rule's, so Linux is unaffected.
  mkdir -p "$INSTALLROOT"
  cp -rf config.mk include lib "$INSTALLROOT/"
  ( cd "$INSTALLROOT/lib" && ls -1 archive/*.a 2>/dev/null | xargs -n 1 ln -sf ) || true
}
