package: powheg-box-v2
description: POWHEG BOX v2 NLO event generator framework
version: "r3744.lhcb3.rdynamic"
tag: "r3744.lhcb3.rdynamic"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/MCGeneratorsTarFiles/%(name)s-%(version)s.tar.gz
requires:
  - fastjet
  - lhapdf
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: LicenseRef-POWHEG
---
#!/bin/bash -e
##############################
. $(bits-include MakeRecipe)
##############################
MODULE_OPTIONS="--bin --lib"
##############################
function Prepare() {
  # macOS: POWHEG-BOX-V2 is not yet ported to macOS — it is a 100+ process,
  # Intel/GNU-ld-flavoured build (Intel -limf, -Wl,--print-map, per-process
  # fastjet/lhapdf interface objects that don't compile under Apple clang). Gate
  # it off here so a whole-stack macOS build doesn't fail on it; it produces an
  # empty package (the Make() guard below + MakeModule). Builds normally on
  # Linux. Remove this guard (and finish the port) to re-enable macOS.
  [ "$(uname)" = Darwin ] && return 0
  rsync -av --delete --exclude '**/.git' --delete-excluded "${SOURCEDIR}"/ ./
  # Makefile.lhcb (the LHCb-custom top-level wrapper) is not in the tarball.
  # Generate one that builds all process subdirectories (tolerating per-process
  # failures) and installs whatever succeeds.
  cat > Makefile.lhcb << 'MKEOF'
FCOMP   ?= gfortran
CCOMP   ?= g++
LHAPDF  ?=
FASTJET ?=
PREFIX  ?= /usr/local

all:
	@for p in $(shell find . -maxdepth 2 -name Makefile | sed 's|^\./||;s|/Makefile||' | grep -v '^\.' | sort); do \
	  echo "--- Building $$p ---"; \
	  $(MAKE) --no-print-directory -C "$$p" \
	    FCOMP="$(FCOMP)" CCOMP="$(CCOMP)" \
	    LHAPDF="$(LHAPDF)" FASTJET="$(FASTJET)" \
	    pwhg_main 2>&1 | tail -3 || true; \
	done

install:
	install -d $(PREFIX)/bin
	@for p in $(shell find . -maxdepth 2 -name pwhg_main | sed 's|^\./||;s|/pwhg_main||' | sort); do \
	  install -m 755 "$$p/pwhg_main" "$(PREFIX)/bin/pwhg_main_$$p" && \
	    echo "Installed pwhg_main_$$p" || true; \
	done

.PHONY: all install
MKEOF
}
function Make() {
  # macOS: gated off (see Prepare). Emit an empty install root so MakeModule has
  # somewhere to write the modulefile, and stop.
  [ "$(uname)" = Darwin ] && { mkdir -p "$INSTALLROOT"; return 0; }
  make ${JOBS:+-j $JOBS} -f Makefile.lhcb \
    FCOMP="${FC:-gfortran}" CCOMP="${CXX}" \
    LHAPDF="${LHAPDF_ROOT}" FASTJET="${FASTJET_ROOT}"
  make -f Makefile.lhcb install PREFIX="${INSTALLROOT}"
}
function MakeInstall() { true; }
