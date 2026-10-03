package: compilebox
description: Compilebox online compiler sandbox service
version: "08.14"
tag: "08.14"
# ~100 nested process builds share $JOBS; cap it so their largest
# compiles fit in the build container's memory.
mem_per_job: 3 GiB
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
# The nested process builds read CXXFLAGS from the env. GoSam's quadninja uses
# __float128 literals (0.Q, 1.iQ): GNU dialect, same level as the stack's -std.
# Drop -g: debug info on the generated amplitude sources is their largest memory
# cost (one cc1plus reached 52 GB) and of no use for generated code.
CXXFLAGS="${CXXFLAGS:-}"; CXXFLAGS="${CXXFLAGS//-std=c++/-std=gnu++}"
CXXFLAGS=" $CXXFLAGS "; CXXFLAGS="${CXXFLAGS// -g / }"
CXXFLAGS="${CXXFLAGS# }"; export CXXFLAGS="${CXXFLAGS% }"
# LCG MCGenerators mirror; the process tarball is named by the LCG author tag.
COMPILEBOX_GEN_URL="https://lcgpackages.web.cern.ch/tarFiles/sources/MCGeneratorsTarFiles"
COMPILEBOX_AUTHOR="ATLASOTF-08-14"
# Optimisation for the huge machine-generated one-function sources (see
# _LimitGeneratedOpt): -O2 on ttJ_MiNNLO's pentagon_gg.cpp needs > 6.8 GB.
COMPILEBOX_GENERATED_OPT="${COMPILEBOX_GENERATED_OPT:--O0}"   # -O1 was still OOM-killed
##############################
function _LimitGeneratedOpt() {
  # ttJ_MiNNLO's two-loop virtuals #include 1-4 MB Maple-generated single
  # functions (auto/penta_*.cpp, auto/remainder_*.cpp). Compile just those at
  # $COMPILEBOX_GENERATED_OPT; source COMPILE_OPTIONS come last, so they win.
  local _cm="$PWD/COMPILEBOX/POWHEG-BOX-V2/ttJ_MiNNLO/CMakeLists.txt" _f _list=""
  [ -f "$_cm" ] || { echo "WARNING: $_cm not found — not limiting optimisation" >&2; return 0; }
  for _f in pentagon_gg pentagon_qq RemainingDiags_gg RemainingDiags_qq; do
    _list="${_list} \${PROCESS_DIR}/Virtuals/${_f}.cpp"
  done
  printf '\n# bits: huge generated sources at reduced optimisation (compilebox.sh)\nset_source_files_properties(%s PROPERTIES COMPILE_OPTIONS "%s")\n' \
    "${_list# }" "${COMPILEBOX_GENERATED_OPT}" >> "$_cm"
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
function Prepare() {
  # Private writable copy (the process builds write generated sources back),
  # then the process tarball; curl because builder images ship it (wget: not always).
  rsync -a --delete "${SOURCEDIR}"/ ./
  curl -fSLO "${COMPILEBOX_GEN_URL}/compilebox-processes-${COMPILEBOX_AUTHOR}.tar.gz"
  tar xf "compilebox-processes-${COMPILEBOX_AUTHOR}.tar.gz" -C "$PWD/COMPILEBOX/"
  _LimitGeneratedOpt
}
function Configure() {
  # No top-level CMakeLists.txt: the project is COMPILEBOX/. Configuring copies the
  # process sources into COMPILEBOX_PROCESSES/, which the two fix-ups below need.
  cmake -S "$PWD/COMPILEBOX" -B "$BITS_CMAKE_BUILD" \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX="$INSTALLROOT" \
    -DCMAKE_CXX_STANDARD=17 \
    -DLOCAL_SOURCE="$PWD/COMPILEBOX/compilebox-processes-${COMPILEBOX_AUTHOR}" \
    -DDESTINATION="$PWD/COMPILEBOX_PROCESSES/"
  cp "$PWD/COMPILEBOX_PROCESSES/POWHEG-BOX-V2/zlibdummy.c" \
     "$PWD/COMPILEBOX_PROCESSES/POWHEG-BOX-RES/zlibdummy.c"
  _SanitiseQCDLoop
}
function Make() {
  cmake --build "$BITS_CMAKE_BUILD" -- ${JOBS:+-j$JOBS}
}
# MakeInstall: the CMakeRecipe default (cmake --install "$BITS_CMAKE_BUILD").
