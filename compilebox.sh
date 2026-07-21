package: compilebox
description: Compilebox online compiler sandbox service
version: "08.11"
tag: "08.11"
sources:
  # The hosted tarball is named by the LCG "author" tag (ATLASOTF-08-11), not the
  # bare version (lcgcmake: author=ATLASOTF-08-11).
  - https://lcgpackages.web.cern.ch/tarFiles/sources/MCGeneratorsTarFiles/compilebox-ATLASOTF-08-11.tar.gz
requires:
  - CMake
  - GSL
  - looptools
  - chaplin
  - cln
  - fastjet
  - ggvvamp
  - lhapdf
  - nlox
  - openloops
  - photoscpp
  - pythia8
  - qqvvamp
  - recola
  # Listed explicitly (not just transitively via recola) because the process
  # sub-builds read RECOLASM_*_ROOT_DIR from these packages' roots.
  - recola_SM
  - recola_SM_ATGC_WARSAW
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: MIT
---
#!/bin/bash -e
##############################
. $(bits-include CMakeRecipe)
##############################
MODULE_OPTIONS="--bin --lib"
##############################
# Each process is a nested ExternalProject, i.e. a separate cmake run that inherits
# the environment but not the outer cache — so these must be env vars, not -D flags
# (lcgcmake sets the same three via LCGPackage_Add ENVIRONMENT).
export PHOTOSPP_ROOT_DIR="${PHOTOSCPP_ROOT}"
export RECOLASM_ROOT_DIR="${RECOLA_SM_ROOT}"
export RECOLASM_ATGC_WARSAW_ROOT_DIR="${RECOLA_SM_ATGC_WARSAW_ROOT}"
##############################
function Configure() {
  # No-op: the tarball has no top-level CMakeLists.txt (the project lives in
  # COMPILEBOX/), and Make() below runs its own cmake once the process tarball is
  # unpacked. The inherited CMakeRecipe Configure would just fail on src/.
  true
}
function _SanitiseQCDLoop() {
  # qcdloop.fnal.gov repacked QCDLoop-<ver>.tar.gz on macOS (June 2026): an AppleDouble
  # entry (._QCDLoop-<ver>) now sits NEXT TO QCDLoop-<ver>/. With two top-level entries
  # FetchContent stops stripping the top dir, so GETQCDLOOP's ff/ql globs come back empty
  # ("No SOURCES given to target: qcdloop"). Same upstream bug as nlox.sh.
  # Repack each requested version with a single top-level dir and point the macro at the
  # local copy. Every step is best-effort: on failure the upstream URL is left untouched.
  local _mod="$PWD/COMPILEBOX/cmake/Modules/COMPILEBOX.cmake" _dir="$PWD/qcdloop-clean"
  local _vers _v _top _ok=0
  [ -f "$_mod" ] || return 0
  # || true: a no-match grep would abort the recipe under `set -e -o pipefail`.
  _vers=$( { grep -rhoE 'GETQCDLOOP\( *[0-9][0-9.]*' "$PWD/COMPILEBOX_PROCESSES" "$PWD/COMPILEBOX" 2>/dev/null \
             || true; } | grep -oE '[0-9][0-9.]*' | sort -u || true)
  [ -n "$_vers" ] || { echo "NOTE: no GETQCDLOOP() call found — leaving the upstream URL" >&2; return 0; }
  mkdir -p "$_dir"
  for _v in $_vers; do
    curl -fSL --retry 3 "https://qcdloop.fnal.gov/QCDLoop-${_v}.tar.gz" -o "$_dir/orig.tar.gz" || continue
    rm -rf "$_dir/x" && mkdir -p "$_dir/x"
    tar -xzf "$_dir/orig.tar.gz" -C "$_dir/x" --exclude='._*' --exclude='.DS_Store' || continue
    _top=$(cd "$_dir/x" && ls -1 | head -1)
    [ -n "$_top" ] || continue
    tar -czf "$_dir/QCDLoop-${_v}-clean.tar.gz" -C "$_dir/x" "$_top" && _ok=1
  done
  [ "$_ok" = 1 ] || { echo "WARNING: QCDLoop sanitise failed — leaving the upstream URL" >&2; return 0; }
  # Rewrite only the URL; ${ver} stays literal so the macro still resolves per process.
  BITS_QLDIR="$_dir" perl -i -pe \
    's|https://qcdloop\.fnal\.gov/QCDLoop-\$\{ver\}\.tar\.gz|file://$ENV{BITS_QLDIR}/QCDLoop-\${ver}-clean.tar.gz|g' \
    "$_mod"
}
function Make() {
  # Extracts process tarballs and writes generated sources back, so operate on the
  # private rsync'd copy ($PWD), never read-only SOURCES. gen_url is the LCG
  # MCGenerators mirror; author=ATLASOTF-08-11 (the LCG author tag).
  local gen_url="https://lcgpackages.web.cern.ch/tarFiles/sources/MCGeneratorsTarFiles"
  local author="ATLASOTF-08-11"
  # curl, not wget: the builder images ship curl (alpgen's Prepare relies on it)
  # but do not guarantee wget.
  curl -fSLO "${gen_url}/compilebox-processes-${author}.tar.gz" \
  && tar xvf "compilebox-processes-${author}.tar.gz" -C "$PWD/COMPILEBOX/" \
  && cmake -DCMAKE_BUILD_TYPE=Release -DLOCAL_SOURCE="$PWD/COMPILEBOX/compilebox-processes-${author}" -DCMAKE_INSTALL_PREFIX="$INSTALLROOT" -DDESTINATION="$PWD/COMPILEBOX_PROCESSES/" -DCMAKE_CXX_STANDARD=17 "$PWD/COMPILEBOX" \
  && cp "$PWD/COMPILEBOX_PROCESSES/POWHEG-BOX-V2/zlibdummy.c" "$PWD/COMPILEBOX_PROCESSES/POWHEG-BOX-RES/zlibdummy.c"
  _SanitiseQCDLoop
  make ${JOBS:+-j $JOBS}
  make install
}
function MakeInstall() { true; }  # install folded into Make()
