package: condor
description: HTCondor workload management system — taken from the system
version: "system"
tag: "system"
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: Apache-2.0
---
#!/bin/bash -e
##############################
# condor is expected to be present on the system.
# This recipe verifies it is available and exports
# CONDOR_ROOT for downstream packages; it does not
# build or install condor itself.
##############################
. $(bits-include ModuleRecipe)

MODULE_OPTIONS="--bin"

function Run() {
  case $1 in
    Prepare) ;;
    *)
      CONDOR_BIN=$(command -v condor_q 2>/dev/null || true)
      if [ -z "$CONDOR_BIN" ]; then
        echo "ERROR: condor not found in PATH. Install HTCondor on this host or" >&2
        echo "       set PATH so that condor_q is reachable before building."    >&2
        exit 1
      fi
      CONDOR_BIN_DIR=$(dirname "$CONDOR_BIN")
      INSTALLROOT=$(dirname "$CONDOR_BIN_DIR")
      echo "Found condor at: $INSTALLROOT"
      MakeModule
      ;;
  esac
}
