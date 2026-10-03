package: Clang-Toolchain
description: Clang/LLVM compiler provided by the build environment (presence + version probe)
# System shim for the clang compiler AXIS: nothing of clang itself is built or
# redistributed here. The build environment supplies clang — a container selects
# clang-$CLANG_VERSION, a bare Linux host uses the system clang, macOS uses the
# Xcode/brew clang — and the prefer_system check below only asserts a suitable
# clang is present (and, on Linux, new enough for the requested major). It mirrors
# GCC-Toolchain's prefer_system role, so when the check passes the package is
# disabled and pruned from the graph (contributes nothing to hashes). This is the
# COMPILER-AXIS probe; the buildable `Clang` (LLVM) package is a separate thing,
# used by packages that need libclang.
license: NOASSERTION
version: "%(tag_basename)s"
tag: v20.1.0
prefer_system: .*
prefer_system_check: |
  set -e
  case $ARCHITECTURE in
    osx*)
      # Apple/Xcode (or brew) clang: its version numbers do NOT map to LLVM's,
      # so check presence only — never a numeric floor.
      command -v "${CXX:-clang++}" >/dev/null 2>&1 || { echo "clang++ missing"; exit 1; }
      exit 0
      ;;
  esac
  # Linux: floor from the requested major (v20.1.0 -> 20), parsed arithmetically
  # so a new clang never needs an edit here. Probe the compiler the build will
  # actually use: an explicit $CXX, else the container's $CLANG_VERSION-suffixed
  # clang++-N, else plain clang++. No container / no axis CXX -> plain-clang check.
  _req=${REQUESTED_VERSION#v}; _maj=${_req%%.*}
  case $_maj in ''|*[!0-9]*) _maj=0 ;; esac
  _cxx=${CXX:-${CLANG_VERSION:+clang++-$CLANG_VERSION}}; _cxx=${_cxx:-clang++}
  command -v "$_cxx" >/dev/null || { echo "$_cxx missing"; exit 1; }
  "$_cxx" -xc++ -fsyntax-only - << EOF
  #if (__clang_major__ < $_maj)
  #error "System clang is older than the requested major version."
  #endif
  EOF
---
# Reached only when prefer_system FAILED (no suitable clang in the environment).
# We do NOT build LLVM here — the clang axis expects the environment to provide
# clang. Fail with guidance rather than silently producing an empty package.
echo "Clang-Toolchain: no suitable clang found for the clang compiler axis." >&2
echo "  Linux: install clang (>= requested major) on PATH, or set" >&2
echo "         CLANG_VERSION=<major> so clang-<major> is used (container model)." >&2
echo "  macOS: xcode-select --install" >&2
echo "  Or build LLVM instead: override the 'Clang' package and require it." >&2
exit 1
