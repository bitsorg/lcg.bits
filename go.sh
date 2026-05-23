package: go
description: Go programming language toolchain (pre-built binary distribution)
version: "1.12.5"
tag: "1.12.5"
build_requires:
  - bits-recipe-tools
license: BSD-3-Clause
---
#!/bin/bash -e
##############################
. $(bits-include BinaryRecipe)
##############################
MODULE_OPTIONS="--bin"
##############################
function Prepare() {
  case $(uname -m) in
    x86_64)  goarch=amd64 ;;
    aarch64) goarch=arm64 ;;
    *) echo "Unsupported architecture: $(uname -m)" >&2; exit 1 ;;
  esac
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
EOF
}
