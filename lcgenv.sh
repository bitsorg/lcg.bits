package: lcgenv
description: LCGenv environment setup script generator
version: "1.3.22"
tag: "v1.3.22"
source: https://gitlab.cern.ch/GENSER/lcgenv.git
build_requires:
  - bits-recipe-tools
license: GPL-3.0-or-later
---
#!/bin/bash -e
##############################
. $(bits-include BinaryRecipe)
##############################
MODULE_OPTIONS="--bin"
##############################
function MakeInstall() {
  install -dm755 "$INSTALLROOT/bin"
  # Install the Python scripts and the env/ directory
  for f in lcgenv_py2 lcgenv_py3 argparse.py; do
    [ -f "$SOURCEDIR/$f" ] && install -m755 "$SOURCEDIR/$f" "$INSTALLROOT/bin/$f"
  done
  # lcgenv is a symlink pointing to lcgenv_py3; recreate it
  ln -sf lcgenv_py3 "$INSTALLROOT/bin/lcgenv"
  # Install env/ configuration directory
  if [ -d "$SOURCEDIR/env" ]; then
    mkdir -p "$INSTALLROOT/share/lcgenv"
    cp -a "$SOURCEDIR/env" "$INSTALLROOT/share/lcgenv/"
  fi
}
