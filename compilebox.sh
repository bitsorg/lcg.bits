package: compilebox
description: Compilebox online compiler sandbox service
version: "08.14"
tag: "08.14"
sources:
  # The hosted tarball is named by the LCG "author" tag (ATLASOTF-08-14), not the
  # bare version (lcgcmake: author=ATLASOTF-08-14).
  - https://lcgpackages.web.cern.ch/tarFiles/sources/MCGeneratorsTarFiles/compilebox-ATLASOTF-08-14.tar.gz
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
# Each process is a nested ExternalProject (separate cmake run, no outer cache), so
# these must be env vars, not -D flags (mirrors lcgcmake's ENVIRONMENT vars).
export PHOTOSPP_ROOT_DIR="${PHOTOSCPP_ROOT}"
export RECOLASM_ROOT_DIR="${RECOLA_SM_ROOT}"
export RECOLASM_ATGC_WARSAW_ROOT_DIR="${RECOLA_SM_ATGC_WARSAW_ROOT}"
export LOOPTOOLS_ROOT_DIR="${LOOPTOOLS_ROOT}"
##############################
function Configure() {
  # No-op: no top-level CMakeLists.txt (project is in COMPILEBOX/); Make() runs its
  # own cmake after unpacking the process tarball.
  true
}
function _SanitiseQCDLoop() {
  # macOS QCDLoop tarballs carry an AppleDouble entry (._QCDLoop-*) that breaks
  # FetchContent's top-dir strip. Repack each requested version with a single top dir
  # and point the macro at it; best-effort (same bug as nlox.sh).
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
  # MCGenerators mirror; author=ATLASOTF-08-14 (the LCG author tag).
  local gen_url="https://lcgpackages.web.cern.ch/tarFiles/sources/MCGeneratorsTarFiles"
  local author="ATLASOTF-08-14"
  # curl (builder images ship it; wget not guaranteed).
  curl -fSLO "${gen_url}/compilebox-processes-${author}.tar.gz" \
  && tar xvf "compilebox-processes-${author}.tar.gz" -C "$PWD/COMPILEBOX/" \
  && cmake -DCMAKE_BUILD_TYPE=Release -DLOCAL_SOURCE="$PWD/COMPILEBOX/compilebox-processes-${author}" -DCMAKE_INSTALL_PREFIX="$INSTALLROOT" -DDESTINATION="$PWD/COMPILEBOX_PROCESSES/" -DCMAKE_CXX_STANDARD=17 "$PWD/COMPILEBOX" \
  && cp "$PWD/COMPILEBOX_PROCESSES/POWHEG-BOX-V2/zlibdummy.c" "$PWD/COMPILEBOX_PROCESSES/POWHEG-BOX-RES/zlibdummy.c"
  _SanitiseQCDLoop
  make ${JOBS:+-j $JOBS}
  make install
}
function MakeInstall() { true; }  # install folded into Make()
