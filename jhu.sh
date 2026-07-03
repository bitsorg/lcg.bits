package: jhu
description: JHU (Johns Hopkins University) generator for Higgs/BSM matrix elements
version: "5.6.3"
tag: "5.6.3"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/MCGeneratorsTarFiles/JHUGenerator.v5.6.3.tar.gz
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: BSD-3-Clause
---
#!/bin/bash -e
##############################
. $(bits-include MakeRecipe)
##############################
MODULE_OPTIONS="--bin"
##############################
function Prepare() {
  # The tarball has multiple top-level dirs with no common prefix; bits' default
  # --strip-components=1 would flatten them. Re-extract with strip=0 to keep the
  # layout (original archive is still in SOURCEDIR).
  local tarball
  tarball=$(ls "$SOURCEDIR"/JHUGenerator*.tar.gz 2>/dev/null | head -1)
  tar xf "$tarball" --strip-components=0 -C ./

  # Fix compiler name: gfort → gfortran (f95 wrapper no longer exists in GCC 15)
  perl -i -pe \
    's/^Comp = gfort$/Comp = gfortran/; s/^ifeq \(\$\(Comp\),gfort\)$/ifeq (\$(Comp),gfortran)/; s/(fcomp\s*=\s*)f95\b/${1}gfortran/' \
    JHUGenerator/makefile

  # Replace $(PWD)-anchored paths with relative paths so the build works
  # from any directory (the makefile used Here=$(PWD) which breaks out-of-tree)
  perl -i -ne '
    next if /^Here = \$\(PWD\)$/;
    s|^ModuleDir = \$\(Here\)/modules|ModuleDir = modules|;
    s|^ObjectDir = \$\(Here\)/objects|ObjectDir = objects|;
    s|^PDFDir = \$\(Here\)/pdfs|PDFDir = pdfs|;
    s|^VegasDir = \$\(Here\)/vegas|VegasDir = vegas|;
    print;
  ' \
    JHUGenerator/makefile

  # Cteq61Pdf.f opens PDF tables with a hard-coded relative path 'pdfs/'.
  # Change it to use $JHU_HOME so the binary works from any working directory.
  python3 - <<'PYEOF'
path = 'JHUGenerator/pdfs/Cteq61Pdf.f'
with open(path) as f:
    src = f.read()
src = src.replace(
    '      Data Isetmin2,Isetmax2 /200,240/\n      save\n',
    '      Data Isetmin2,Isetmax2 /200,240/\n      CHARACTER(LEN=255) jhu_home\n      save\n',
)
src = src.replace(
    "         Open(IU, File='pdfs/'//Tablefile",
    "         CALL getenv('JHU_HOME',jhu_home)\n"
    "         Open(IU, File=TRIM(jhu_home)//'/pdfs/'//Tablefile",
)
with open(path, 'w') as f:
    f.write(src)
PYEOF
}

function Make() {
  # Force serial: Fortran module ordering makes parallel builds unreliable
  make -j1 -C JHUGenerator Comp=${FC:-gfortran}
}

function MakeInstall() {
  install -Dm755 JHUGenerator/JHUGen "$INSTALLROOT/bin/JHUGen"
  # Install PDF/data tables referenced at runtime via $JHU_HOME
  mkdir -p "$INSTALLROOT/share/JHUGenerator/pdfs"
  cp -a JHUGenerator/pdfs/*.tbl JHUGenerator/pdfs/*.dat \
    "$INSTALLROOT/share/JHUGenerator/pdfs/" 2>/dev/null || true
}

function PostInstall() {
  echo "setenv JHU_HOME \$env(JHU_ROOT)/share/JHUGenerator" >> "$MODULEFILE"
}
