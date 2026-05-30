package: rivet
description: Rivet Monte Carlo analysis toolkit
version: "3.1.5p1"
tag: "3.1.5p1"
sources:
  # The "p1" is an LCG patch-level label on the version, not part of the
  # upstream filename (cf. lcgcmake's Rivet-<author>.tar.bz2). The hosted
  # tarball is Rivet-3.1.5.tar.bz2; Rivet-3.1.5p1.tar.bz2 returns HTTP 404.
  - https://lcgpackages.web.cern.ch/tarFiles/sources/MCGeneratorsTarFiles/Rivet-3.1.5.tar.bz2
requires:
  - hepmc3
  - yoda
  - fastjet
  - fjcontrib
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: GPL-3.0-only
patches:
  - rivet-3.1.5p1.patch
---
#!/bin/bash -e
##############################
. $(bits-include AutoToolsRecipe)
##############################
MODULE_OPTIONS="--bin --lib"
##############################
function Configure() {

  (
  unset PYTHON_VERSION

  # HepMC3 3.3.x exposes its vendored bxzstr (namespace strict_fstream) through
  # ReaderFactory.h -> CompressedIO.h; Rivet vendors its own zstr/strict_fstream
  # in the same namespace but with a different include guard
  # (__STRICT_FSTREAM_HPP vs bxzstr's BXZSTR_STRICT_FSTREAM_HPP), so translation
  # units that include both (e.g. RivetHepMC_3.cc) fail with "redefinition of
  # class strict_fstream::...".  Unify Rivet's guard with bxzstr's so whichever
  # copy is included first wins and the second is skipped.
  sed -i 's/__STRICT_FSTREAM_HPP/BXZSTR_STRICT_FSTREAM_HPP/g' \
    src/Core/zstr/strict_fstream.hpp

  autoreconf -ivf

  # Discover dep prefixes via config tools if env vars are not set
  [[ -z "$HEPMC3_ROOT"  ]] && HEPMC3_ROOT=$(HepMC3-config --prefix 2>/dev/null)   || true
  [[ -z "$YODA_ROOT"    ]] && YODA_ROOT=$(yoda-config --prefix 2>/dev/null)        || true
  [[ -z "$FASTJET_ROOT" ]] && FASTJET_ROOT=$(fastjet-config --prefix 2>/dev/null)  || true

  LOCAL_LDFLAGS=""
  case $(uname) in
    Linux) LOCAL_LDFLAGS="-Wl,--no-as-needed" ;;
  esac

  # gcc 15 / libstdc++ no longer transitively include <cstdint>, and
  # Rivet/Tools/RivetSTL.hh uses uintptr_t without including it
  # ("error: 'uintptr_t' does not name a type").  Force-include <cstdint> for
  # every translation unit; keep the stack's existing CXXFLAGS (e.g. -std=c++20).
  # -fpermissive: gcc 15's new -Wtemplate-body diagnoses errors in template
  # definitions (e.g. Rivet's bundled old Eigen3 Transpositions.h "has no member
  # named 'derived'"); -fpermissive downgrades these to warnings so the
  # vendored Eigen still compiles.
  # Rivet requires FastJet Contrib headers (fastjet/contrib/SoftDrop.hh) and
  # libs, which bits ships as the separate fjcontrib package; point Rivet at it
  # with --with-fjcontrib (mirrors lcgcmake's rivet --with-fjcontrib).
  ./configure --prefix="$INSTALLROOT" \
    --disable-silent-rules \
    --disable-doxygen \
    ${HEPMC3_ROOT:+--with-hepmc3="$HEPMC3_ROOT"} \
    ${YODA_ROOT:+--with-yoda="$YODA_ROOT"} \
    ${FASTJET_ROOT:+--with-fastjet="$FASTJET_ROOT"} \
    ${FJCONTRIB_ROOT:+--with-fjcontrib="$FJCONTRIB_ROOT"} \
    CXXFLAGS="${CXXFLAGS} -include cstdint -fpermissive" \
    LDFLAGS="$LOCAL_LDFLAGS"
  )
}
function PostInstall() {
  PYVER=$(python3 -c 'import sys; print("python%d.%d" % sys.version_info[:2])' 2>/dev/null || echo "python3")
  cat >> "$INSTALLROOT/etc/modulefiles/$PKGNAME" << MODEOF
prepend-path PYTHONPATH \$PKG_ROOT/lib/${PYVER}/site-packages
setenv RIVET_ANALYSIS_PATH \$PKG_ROOT/lib/Rivet
setenv RIVET_DATA_PATH \$PKG_ROOT/share/Rivet
MODEOF
}
