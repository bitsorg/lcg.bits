package: adaptyst
description: Adaptyst performance profiling framework (CERN)
# Adaptyst has no release tarball on the LCG mirror (adaptyst-HEAD.tar.gz 404s);
# under dev4 (HEAD) track the upstream git default branch.
version: "main"
tag: "main"
source: https://github.com/Adaptyst/Adaptyst.git
requires:
  - CMake
  - Boost
  - jsonmcpp
  - poco
  - utf8proc
  - cli11
  - libarchive
  - libbpf
  - libnuma
  - libtraceevent
  - yacc-like
  - Python
  - perf
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: Apache-2.0
---
#!/bin/bash -e
##############################
. $(bits-include CMakeRecipe)
##############################
MODULE_OPTIONS="--bin --lib"
##############################
function Configure() {
  # Poco is built POCO_UNBUNDLED=ON against external utf8proc, so its exported
  # PocoFoundationConfig.cmake does find_dependency(Utf8Proc). That re-search
  # uses Poco's FindUtf8Proc module, which needs the UTF8PROC_* cache vars set
  # (Poco's own build passed them) -- otherwise consumers fail with "Could NOT
  # find Utf8Proc". Pre-set them here, exactly as poco.sh does.
  #
  # perf is now a system_requirement (no PERF_ROOT exported), so point PERF_DIR
  # at the system prefix where the distro 'perf' lives (/usr/bin/perf).
  cmake "${SOURCEDIR}" \
      -DCMAKE_INSTALL_PREFIX="${INSTALLROOT}" \
    ${CMAKE_PREFIX_PATH:+-DCMAKE_PREFIX_PATH="${CMAKE_PREFIX_PATH}"} \
      -DCMAKE_BUILD_TYPE=Release \
    -DADAPTYST_SCRIPT_PATH="$INSTALLROOT/share/adaptyst" \
    -DADAPTYST_CONFIG_PATH="$INSTALLROOT/etc/adaptyst.conf" \
    -DCMAKE_CXX_STANDARD=17 \
    -DUTF8PROC_INCLUDE_DIR="${UTF8PROC_ROOT}/include" \
    -DUTF8PROC_LIBRARY="${UTF8PROC_ROOT}/lib/libutf8proc.so" \
    -DPERF_DIR="${PERF_ROOT:-/usr}"
}
