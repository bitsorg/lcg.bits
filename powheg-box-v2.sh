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
  rsync -av --delete --exclude '**/.git' --delete-excluded "${SOURCEDIR}"/ ./
  # macOS: the process Makefiles link against Intel's libimf (-limf), which does
  # not exist on macOS (the gfortran stack uses the system libm). Strip it from
  # every process Makefile so the link can proceed; GNU-ld-only tricks that a few
  # processes use (e.g. -Wl,--print-map in ttb_dec/Z2jet/W2jet/VBF_HJJJ) are left
  # to fail per-process, which the wrapper below tolerates. Linux keeps -limf.
  if [ "$(uname)" = Darwin ]; then
    find . -maxdepth 2 -name Makefile -exec perl -i -pe 's/(^|\s)-limf\b//g' {} +
  fi
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
	    pwhg_main 2>&1 | tail -50 || true; \
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
  make ${JOBS:+-j $JOBS} -f Makefile.lhcb \
    FCOMP="${FC:-gfortran}" CCOMP="${CXX}" \
    LHAPDF="${LHAPDF_ROOT}" FASTJET="${FASTJET_ROOT}"
  make -f Makefile.lhcb install PREFIX="${INSTALLROOT}"
}
function MakeInstall() { true; }
