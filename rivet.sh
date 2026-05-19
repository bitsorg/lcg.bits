package: rivet
description: Rivet Monte Carlo analysis toolkit
version: "3.1.5p1"
tag: "3.1.5p1"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/MCGeneratorsTarFiles/Rivet-3.1.5p1.tar.bz2
requires:
  - hepmc3
  - yoda
  - fastjet
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
  rsync -a --delete --exclude '**/.git' "$SOURCEDIR"/ .

  (
  unset PYTHON_VERSION
  autoreconf -ivf

  # Discover dep prefixes via config tools if env vars are not set
  [[ -z "$HEPMC3_ROOT"  ]] && HEPMC3_ROOT=$(HepMC3-config --prefix 2>/dev/null)   || true
  [[ -z "$YODA_ROOT"    ]] && YODA_ROOT=$(yoda-config --prefix 2>/dev/null)        || true
  [[ -z "$FASTJET_ROOT" ]] && FASTJET_ROOT=$(fastjet-config --prefix 2>/dev/null)  || true

  LOCAL_LDFLAGS=""
  case $(uname) in
    Linux) LOCAL_LDFLAGS="-Wl,--no-as-needed" ;;
  esac

  ./configure --prefix="$INSTALLROOT" \
    --disable-silent-rules \
    --disable-doxygen \
    ${HEPMC3_ROOT:+--with-hepmc3="$HEPMC3_ROOT"} \
    ${YODA_ROOT:+--with-yoda="$YODA_ROOT"} \
    ${FASTJET_ROOT:+--with-fastjet="$FASTJET_ROOT"} \
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
