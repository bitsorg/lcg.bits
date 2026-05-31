package: sherpa
description: Sherpa multi-purpose Monte Carlo event generator
version: "2.2.11p2"
mem_per_job: 1500
tag: "2.2.11p2"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/MCGeneratorsTarFiles/SHERPA-MC-2.2.11.tar.gz
requires:
  - lhapdf
  - fastjet
  - openloops
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: GPL-2.0-or-later
patches:
  - sherpa-2.2.11p2.patch
---
#!/bin/bash -e
##############################
. $(bits-include AutoToolsRecipe)
##############################
MODULE_OPTIONS="--bin --lib"
##############################
function Configure() {

  # Exclude building Manual (requires LaTeX)
  sed -i.bak '/Manual/d' Makefile.am 2>/dev/null || true
  rm -f Makefile.am.bak

  autoreconf -ivf

  # Sherpa's configure uses wget; provide a curl-based shim
  mkdir -p fakewget
  printf '#!/bin/sh\nexec curl -fO "$1"\n' > fakewget/wget
  chmod +x fakewget/wget
  export PATH="$PWD/fakewget:$PATH"

  ./configure --prefix="$INSTALLROOT" \
    ${LHAPDF_ROOT:+--enable-lhapdf=$LHAPDF_ROOT} \
    ${FASTJET_ROOT:+--enable-fastjet=$FASTJET_ROOT} \
    ${OPENLOOPS_ROOT:+--enable-openloops=$OPENLOOPS_ROOT}
}
function PostInstall() {
  cat >> "$INSTALLROOT/etc/modulefiles/$PKGNAME" << 'EOF'
setenv SHERPA_ROOT $PKG_ROOT
setenv SHERPA_INSTALL_PATH $PKG_ROOT/lib/SHERPA-MC
setenv SHERPA_SHARE_PATH $PKG_ROOT/share/SHERPA-MC
EOF
}
