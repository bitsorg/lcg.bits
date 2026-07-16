package: madgraph5amc
description: MadGraph5_aMC@NLO automated leading and next-to-leading order generator
version: "3.3.1.atlas1"
tag: "3.3.1.atlas1"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/MCGeneratorsTarFiles/MG5_aMC_v3.3.1.tar.gz
requires:
  - Python
  - syscalc
  - six
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: GPL-3.0-or-later
patches:
  - madgraph5amc-3.3.1.atlas1.patch
---
#!/bin/bash -e
##############################
. $(bits-include MakeRecipe)
##############################
MODULE_OPTIONS="--bin"
##############################
function Make() {
  # MadGraph5_aMC runs in place from its own root; the only thing to pre-build is
  # the vendored CutTools (built serially - its makefile isn't parallel-safe).
  # Everything else MadGraph compiles on demand at run time.
  make -C vendor/CutTools
}
function MakeInstall() {
  # "Install" by relocating the whole patched + partially-built tree into the
  # prefix; bin/mg5_aMC discovers MG5DIR relative to itself (MadGraph has no install
  # target). First rewrite the build path in the config files so the tree is consistent.
  local cfg
  for cfg in input/mg5_configuration.txt input/.mg5_configuration_default.txt; do
    [ -f "${cfg}" ] || continue
    sed -i.bak -e "s|${PWD}|${INSTALLROOT}|g" "${cfg}"
    rm -f "${cfg}.bak"
  done
  mkdir -p "${INSTALLROOT}"
  rsync -a --exclude '**/.git' --exclude '*.tgz' --exclude 'vendor/*.tar.gz' \
        ./ "${INSTALLROOT}/"
}
function PostInstall() {
  # bin/ is already on PATH via MODULE_OPTIONS=--bin; also expose the MG5 root
  # for downstream tools that look it up by environment.
  cat >> "${INSTALLROOT}/etc/modulefiles/${PKGNAME}" <<'EOF'
setenv MADPATH $PKG_ROOT
setenv MADGRAPH5AMC_ROOT $PKG_ROOT
EOF
}