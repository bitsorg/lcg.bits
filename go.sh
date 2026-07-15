package: go
description: Go programming language toolchain (pre-built binary distribution)
version: "1.12.5"
tag: "1.12.5"
# macOS: Go 1.12.5 predates Apple Silicon (no darwin-arm64 build), and the
# Linux tarball below cannot run on macOS ("cannot execute binary file"). Source
# a modern Go from Homebrew instead and expose its SDK as GOROOT under
# $INSTALLROOT, so the existing GOPATH-style go_* recipes (GOROOT=$GO_ROOT,
# `go install <importpath>`) keep working. The module forces GO111MODULE=off so
# modern Go still uses GOPATH/legacy mode. prefer_system gated osx.*; Linux keeps
# the pinned 1.12.5 binary below.
prefer_system: "osx.*"
homebrew_formula: go
prefer_system_check: |
  #!/bin/bash
  # Only runs on macOS (osx.* gate). Install on demand with `bits --brew`;
  # otherwise the replacement build reports the missing formula.
  if [ "${BITS_BREW:-}" = "1" ] && ! brew --prefix go >/dev/null 2>&1; then
    brew install go >&2 || true
  fi
  echo "bits_system_replace: go"
prefer_system_replacement_specs:
  go:
    version: "homebrew"
    # Exported into the build environment of go_* consumers (a dependency's
    # env: block propagates to dependents' builds; modulefile setenv does not).
    # GO111MODULE=off keeps the GOPATH-style `go install <importpath>` recipes
    # working under modern Go; GOCACHE moves Go's build cache out of the home
    # dir (~/Library/Caches/go-build is outside the build sandbox).
    env:
      GO111MODULE: "off"
      GOCACHE: "/tmp/bits-go-build"
    build_requires:
      - bits-recipe-tools
    recipe: |
      #!/bin/bash -e
      # Expose Homebrew's modern Go SDK (its libexec is GOROOT) as $INSTALLROOT so
      # GO_ROOT is a valid GOROOT for the GOPATH-style go_* recipes.
      prefix=$(brew --prefix go 2>/dev/null) || prefix=/opt/homebrew/opt/go
      goroot="$prefix/libexec"
      if [ ! -x "$goroot/bin/go" ]; then
        echo "go: Homebrew Go SDK not found at $goroot." >&2
        echo "go:   brew install go   (or re-run bits with --brew)" >&2
        exit 1
      fi
      mkdir -p "$INSTALLROOT"
      for _d in "$goroot"/*; do ln -snf "$_d" "$INSTALLROOT/$(basename "$_d")"; done
      MODULE_OPTIONS="--bin"
      . $(bits-include ModuleRecipe)
      MakeModule
      # GOROOT = this prefix; force GOPATH/legacy mode (the go_* recipes use
      # `go install <importpath>` with an assembled GOPATH, not Go modules).
      _mf="$INSTALLROOT/etc/modulefiles/go"
      {
        echo 'setenv GOROOT $env(GO_ROOT)'
        echo 'setenv GO111MODULE off'
        # Go's default build cache is ~/Library/Caches/go-build, outside the
        # build sandbox ("operation not permitted"). Redirect it to a sandbox-
        # writable path so the go_* recipes' `go install` can write the cache.
        echo 'setenv GOCACHE /tmp/bits-go-build'
      } >> "$_mf"
# Exported into the build environment of go_* consumers (a dependency's env:
# block propagates to dependents' builds; a modulefile setenv does not). This is
# the Linux (from-source) counterpart of the osx prefer_system env above.
# GO111MODULE=off keeps the GOPATH-style `go install <importpath>` recipes working;
# GOCACHE redirects Go's build cache off $HOME — its default ~/.cache/go-build is
# unwritable in the build container ("mkdir /.cache: permission denied").
env:
  GO111MODULE: "off"
  GOCACHE: "/tmp/bits-go-build"
build_requires:
  - bits-recipe-tools
license: BSD-3-Clause
---
#!/bin/bash -e
##############################
. $(bits-include BinaryRecipe)
. $(bits-include BitsArch)
##############################
MODULE_OPTIONS="--bin"
##############################
function Prepare() {
  local goarch; goarch=$(bits_goarch)
  local url="https://dl.google.com/go/go${PKGVERSION}.linux-${goarch}.tar.gz"
  # The official Go tarball has a single top-level 'go/' directory; strip it.
  curl -fSL "$url" | tar -xz --strip-components=1 -C ./
}

function MakeInstall() {
  install -dm755 "$INSTALLROOT/bin"
  cp -a bin/. "$INSTALLROOT/bin/"
  # Ship the standard library and tools so users can compile Go programs
  cp -a pkg src lib "$INSTALLROOT/" 2>/dev/null || true
}

function PostInstall() {
  cat >> "$MODULEFILE" <<'EOF'
setenv GOROOT $env(GO_ROOT)
setenv GO111MODULE off
setenv GOCACHE /tmp/bits-go-build
EOF
}
