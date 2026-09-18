package: GCC-Toolchain
license: GPL-3.0-or-later WITH GCC-exception-3.1
version: "%(tag_basename)s"
tag: v14.2.0-alice2
source: https://gitlab.cern.ch/bits/gcc-toolchain
prepend_path:
  "LD_LIBRARY_PATH": "$GCC_TOOLCHAIN_ROOT/lib64"
  "PATH": "$GCC_TOOLCHAIN_ROOT/libexec/bin"
build_requires:
  - "autotools:(slc6|slc7)"
  - yacc-like
# own_hash: the built compiler is invariant to the community defaults, so its
# identity hash excludes defaults-release -> one certified build is reused across
# communities from the S3 cache (see ADR-0012). The axis still differentiates via
# the tag override below. Only the compiler; its bootstrap deps are system reqs.
own_hash: true
prefer_system: .*
prefer_system_check: |
  set -e
  # Minimum __GNUC__ floor from the requested version, parsed arithmetically
  # (v15.2.0-alice1 -> 150200) so a NEW gcc never needs an edit here — a new
  # compiler arrives only as a defaults-gccNN overriding the tag. Unparseable
  # or "unavailable" falls back to the historical 7.3 floor.
  _req=${REQUESTED_VERSION#v}
  _maj=${_req%%.*}; _rest=${_req#*.}; _min=${_rest%%.*}
  case $_maj in ''|*[!0-9]*) _maj=0 ;; esac
  case $_min in ''|*[!0-9]*) _min=0 ;; esac
  if [ "$_maj" -eq 0 ]; then MIN_GCC_VERSION=70300; else MIN_GCC_VERSION=$(( _maj*10000 + _min*100 )); fi
  # Probe the compiler the build will actually use: an explicit $CC, else the
  # container's $GCC_VERSION-suffixed binaries (gcc-15 ...), else the plain names.
  # With no container and no axis CC this is the historical plain-gcc check.
  _cc=${CC:-${GCC_VERSION:+gcc-$GCC_VERSION}};       _cc=${_cc:-gcc}
  _cxx=${CXX:-${GCC_VERSION:+g++-$GCC_VERSION}};      _cxx=${_cxx:-g++}
  _fc=${FC:-${GCC_VERSION:+gfortran-$GCC_VERSION}};   _fc=${_fc:-gfortran}
  which make || { echo "make missing"; exit 1; }
  command -v "$_fc"  >/dev/null || { echo "$_fc missing"; exit 1; }
  command -v "$_cc"  >/dev/null || { echo "$_cc missing"; exit 1; }
  command -v "$_cxx" >/dev/null || { echo "$_cxx missing"; exit 1; }
  "$_cxx" -xc++ - -c -o /dev/null << EOF
  #define GCCVER ((__GNUC__ * 10000)+(__GNUC_MINOR__ * 100)+(__GNUC_PATCHLEVEL__))
  #if (GCCVER < $MIN_GCC_VERSION)
  #error "System's GCC cannot be used: we need at least ($MIN_GCC_VERSION/1e4), while we intend to go for GCC $REQUESTED_VERSION. We'll compile our own version."
  #endif
  EOF
env:
  CCACHE_CONFIGPATH: "$GCC_TOOLCHAIN_ROOT/etc/ccache.conf"
  # Highest C++ standard this compiler supports, as a bare number for downstream
  # recipes (-DCMAKE_CXX_STANDARD=$CXXSTD). Source builds record it in etc/cxxstd;
  # on prefer_system that's absent, so probe g++/c++ directly. No '%' or '"' chars.
  CXXSTD: "$( f=$GCC_TOOLCHAIN_ROOT/etc/cxxstd; if [ -r $f ]; then cat $f; else c=$(command -v g++ || command -v c++ || echo g++); r=23; for s in 23 20 17; do printf 'int main(){}' | $c -std=c++$s -fsyntax-only -x c++ - >/dev/null 2>&1 && { r=$s; break; }; done; echo $r; fi )"
---
# Fix syntax highlight
cat <<EOF
EOF
unset CXXFLAGS
unset CFLAGS

echo "Building GCC because no compatible version was found on the system. To skip this step, install GCC 4.8 or 4.9, or 5.X (with the exception of 5.0 to 5.2). Make sure you have gfortran installed too."

case $ARCHITECTURE in
  osx*)
    EXTRA_LANGS=',objc,obj-c++'
    MARCH=
  ;;
  # Match both the aliBuild token (x86-64) and the SFT/el+ubuntu token (x86_64),
  # anywhere in the arch string, so el9/el10/ubuntu* all set the right --build.
  *x86-64*|*x86_64*)
    MARCH='x86_64-unknown-linux-gnu'
  ;;
  *)
    MARCH=
  ;;
esac

rsync -a --exclude='**/.git' --delete --delete-excluded "$SOURCEDIR/" ./

# The ISL C++17 self-tests need the C++17-only isl/cpp.h API, but GCC's bootstrap
# pins CXX to -std=c++14, so they fail during `all`. They're irrelevant to the
# produced compiler, so strip their refs from Makefile.am/.in (avoids autoreconf).
for _isl_mk in gcc/isl/Makefile.am gcc/isl/Makefile.in; do
  [[ -f "$_isl_mk" ]] && sed -i '/isl_test_cpp17/d' "$_isl_mk" || true
done
unset _isl_mk

if [ -e autoconf-archive ]; then
  (cd autoconf-archive && autoreconf -ivf )
  mkdir build-autoconf-archive
  pushd build-autoconf-archive
    ../autoconf-archive/configure --prefix="$INSTALLROOT"
    make install MAKEINFO=":"
  popd
  export ACLOCAL_PATH=$INSTALLROOT/share/aclocal
fi

# Binutils
mkdir build-binutils
pushd build-binutils
  ../binutils/configure --prefix="$INSTALLROOT"                \
                        ${MARCH:+--build=$MARCH --host=$MARCH} \
                        --enable-ld=default                    \
                        --enable-lto                           \
                        --enable-plugins                       \
                        --enable-threads                       \
                        --enable-gprofng=no                    \
                        --disable-werror                       \
                        --disable-nls
  make ${JOBS:+-j$JOBS} MAKEINFO=":"
  make install MAKEINFO=":"
  hash -r
popd

# Test program
cat > test.c <<EOF
#include <string.h>
#include <stdio.h>
int main(void) { printf("The answer is 42.\n"); }
EOF

# We will need to rebuild them with the final GCC
rsync -a gcc/mpfr/ mpfr
rsync -a gcc/gmp/ gmp
rsync -a gcc/isl/ isl
rsync -a gcc/mpc/ mpc

pushd gcc
  [ -d mpfr ] && (cd mpfr && autoreconf -ivf)
  [ -d mpc ] && (cd mpc && autoreconf -ivf)
  [ -d gmp ] && (cd gmp && autoreconf -ivf)
  [ -d isl ] && (cd isl && autoreconf -ivf)
  [ -d cloog ] && (cd cloog && autoreconf -ivf)
popd

[ -d mpfr ] && (cd mpfr && autoreconf -ivf)
[ -d mpc ] && (cd mpc && autoreconf -ivf)
[ -d gmp ] && (cd gmp && autoreconf -ivf)
[ -d isl ] && (cd isl && autoreconf -ivf)
[ -d cloog ] && (cd cloog && autoreconf -ivf)

# GCC <=14 ships a libsanitizer that references `struct termio`, which modern
# glibc has removed — the sanitizer library then fails to compile (incomplete
# type). Probe the build glibc and disable libsanitizer ONLY when termio is gone,
# so sanitizers are kept on older distros and the compiler still builds on the
# newest ones (GCC 15 fixed this upstream). Best-effort: if the probe compiler is
# missing we leave libsanitizer enabled.
LIBSAN_FLAG=
if command -v "${CC:-gcc}" >/dev/null 2>&1 &&
   ! printf '#include <sys/ioctl.h>\n#include <termios.h>\nint main(){return (int)sizeof(struct termio);}\n' \
     | "${CC:-gcc}" -x c - -o /dev/null >/dev/null 2>&1; then
  echo "[toolchain] system glibc has no 'struct termio' -> configuring GCC with --disable-libsanitizer"
  LIBSAN_FLAG=--disable-libsanitizer
fi

mkdir build-gcc
pushd build-gcc
  # --disable-werror: newer host compilers emit more warnings; a bootstrap must
  # not turn them into fatal errors (mirrors binutils above).
  ../gcc/configure --prefix="$INSTALLROOT"                          \
                   ${MARCH:+--build=$MARCH --host=$MARCH}           \
                   --enable-languages="c,c++,fortran${EXTRA_LANGS}" \
                   --disable-multilib                               \
                   --enable-ld=default                              \
                   --enable-lto                                     \
                   --disable-werror                                 \
                   ${LIBSAN_FLAG}                                   \
                   --disable-nls
  make ${JOBS:+-j$JOBS} bootstrap-lean MAKEINFO=":"
  make install MAKEINFO=":"
  hash -r

  # GCC creates c++, but not cc
  ln -nfs gcc "$INSTALLROOT/bin/cc"
  rm -rf "$INSTALLROOT/lib/pkg-config"

  rm -f "$INSTALLROOT"/lib/*.la \
        "$INSTALLROOT"/lib64/*.la
popd

# From now on, use own linker and GCC
export PATH="$INSTALLROOT/bin:$PATH"
export LD_LIBRARY_PATH="$INSTALLROOT/lib64:$INSTALLROOT/lib:$LD_LIBRARY_PATH"
hash -r

# Test own linker and own GCC
type ld
type g++
g++ test.c
./a.out
rm -f a.out

# Build a very basic CMake, to compile ccache and nothing else
# in case we manage, we build ccache
if [ -e ccache ]; then
  # ccache is an optional, default-disabled accelerator. Some tags ship a ccache
  # whose CMake fails, which must NOT abort the whole toolchain (gcc is already
  # built above). Build ccache best-effort.
  if ( set -e
  mkdir -p build-cmake
  pushd build-cmake
  cat > build-flags.cmake <<- EOF
# Disable Java capabilities; we don't need it and on OS X might miss the
# required /System/Library/Frameworks/JavaVM.framework/Headers/jni.h.
SET(JNI_H FALSE CACHE BOOL "" FORCE)
SET(Java_JAVA_EXECUTABLE FALSE CACHE BOOL "" FORCE)
SET(Java_JAVAC_EXECUTABLE FALSE CACHE BOOL "" FORCE)

# SL6 with GCC 4.6.1 and LTO requires -ltinfo with -lcurses for link to succeed,
# but cmake is not smart enough to find it. We do not really need ccmake anyway,
# so just disable it.
SET(BUILD_CursesDialog FALSE CACHE BOOL "" FORCE)
EOF
    $SOURCEDIR/cmake/bootstrap --prefix=$BUILDDIR/bootstrap-cmake \
                               --no-debugger                      \
                               --no-qt-gui                        \
                               --init=build-flags.cmake           \
                               ${JOBS:+--parallel=$JOBS}
    make ${JOBS:+-j$JOBS}
    make install/strip
  popd

  # We build ccache using our own compiler, so that we do not have issue
  # with libstdc++ compatibility.
  mkdir build-ccache
  pushd build-ccache
    # Disable ccache's Redis backend: it pulls in hiredis, which ccache's CMake
    # fetches from GitHub via FetchContent (non-reproducible, network-dependent).
    # A compile cache needs no Redis; HIREDIS_FROM_INTERNET=OFF guards residual fetch.
    $BUILDDIR/bootstrap-cmake/bin/cmake -S ../ccache \
        -DENABLE_DOCUMENTATION=OFF                   \
        -DENABLE_TESTING=OFF                         \
        -DSTATIC_LINK=ON                             \
        -DREDIS_STORAGE_BACKEND=OFF                  \
        -DHIREDIS_FROM_INTERNET=OFF                  \
        -DCMAKE_INSTALL_PREFIX="$INSTALLROOT/libexec/ccache"
    make ${JOBS:+-j $JOBS} install
    ln -sf ccache $INSTALLROOT/libexec/ccache/bin/gcc
    ln -sf ccache $INSTALLROOT/libexec/ccache/bin/g++
    ln -sf ccache $INSTALLROOT/libexec/ccache/bin/cc
    ln -sf ccache $INSTALLROOT/libexec/ccache/bin/c++
    # Notice how we configure CCACHE to work, but then
    # disable so that users need to export CCACHE_DISABLE=false
    # to actually have it working.
    mkdir -p $INSTALLROOT/libexec/ccache/etc
    cat > $INSTALLROOT/libexec/ccache/etc/ccache.conf <<EOF
cache_dir=$WORK_DIR/TMP/ccache/$ARCHITECTURE
disable=true
EOF
  popd
  ); then
    export PATH=$INSTALLROOT/libexec/ccache/bin:$PATH
  else
    echo "WARNING: ccache build failed — continuing without it (optional accelerator, disabled by default)." >&2
  fi
fi

# We rebuild mpfr, gmp, isl to be used with gdb. We do so because
# we want to make sure they were actually built with the GCC we
# use, not with the bootstrap xgcc.
[ -d mpfr ] && (cd mpfr && autoreconf -ivf)
[ -d gmp ] && (cd gmp && autoreconf -ivf)
[ -d isl ] && (cd isl && autoreconf -ivf)
[ -d mpc ] && (cd mpc && autoreconf -ivf)
mkdir -p build-gmp
mkdir -p build-mpfr
mkdir -p build-isl
mkdir -p build-mpc

pushd build-gmp
  ../gmp/configure --prefix="$INSTALLROOT/libexec/extra"  \
                   --disable-shared                       \
                   --enable-static
  make ${JOBS:+-j$JOBS} MAKEINFO=":"
  make install MAKEINFO=":"
popd

pushd build-mpfr
  ../mpfr/configure --prefix="$INSTALLROOT/libexec/extra"  \
                   --disable-shared                        \
                   --with-gmp="$INSTALLROOT/libexec/extra" \
                   --enable-static
  make ${JOBS:+-j$JOBS} MAKEINFO=":"
  make install MAKEINFO=":"
popd

pushd build-isl
  ../isl/configure --prefix="$INSTALLROOT/libexec/extra"          \
                   --with-gmp-prefix="$INSTALLROOT/libexec/extra" \
                   --disable-shared                               \
                   --enable-static
  make ${JOBS:+-j$JOBS} MAKEINFO=":"
  make install MAKEINFO=":"
popd

pushd build-mpc
  ../mpc/configure --prefix="$INSTALLROOT/libexec/extra"    \
                   --disable-shared                         \
                   --with-gmp="$INSTALLROOT/libexec/extra"  \
                   --with-mpfr="$INSTALLROOT/libexec/extra" \
                   --enable-static
  make ${JOBS:+-j$JOBS} MAKEINFO=":"
  make install MAKEINFO=":"
popd

# GDB
mkdir build-gdb
pushd build-gdb
  ../gdb/configure --prefix="$INSTALLROOT"                \
                   ${MARCH:+--build=$MARCH --host=$MARCH} \
                   --with-gmp=$INSTALLROOT/libexec/extra  \
                   --with-mpfr=$INSTALLROOT/libexec/extra \
                   --with-isl=$INSTALLROOT/libexec/extra  \
                   --with-mpc=$INSTALLROOT/libexec/extra  \
                   --without-guile                        \
                   --without-python                       \
                   --disable-multilib
  make ${JOBS:+-j$JOBS} MAKEINFO=":"
  make install MAKEINFO=":"
  hash -r
  rm -f "$INSTALLROOT"/lib/*.la
popd

# We remove the sim folder because it's not used and actually
# conflicts with FairRoot when installing in a single installation
# path.
rm -fr "$INSTALLROOT"/include/sim
# If fixincludes is not desired, see:
# http://ewontfix.com/12/
# https://sources.gentoo.org/cgi-bin/viewvc.cgi/gentoo-x86/eclass/toolchain.eclass?view=markup&sortby=log#l1524

# Record the highest C++ standard the freshly built compiler accepts, so the env
# can export CXXSTD to downstream recipes (single source of truth). Probe newest
# to oldest and keep the first that compiles.
mkdir -p "$INSTALLROOT/etc"
_cxxstd=23
for _s in 23 20 17; do
  if printf 'int main(){}' | "$INSTALLROOT/bin/g++" -std=c++$_s -fsyntax-only -x c++ - >/dev/null 2>&1; then
    _cxxstd=$_s
    break
  fi
done
echo "$_cxxstd" > "$INSTALLROOT/etc/cxxstd"
unset _cxxstd _s

# Modulefile
MODULEDIR="$INSTALLROOT/etc/modulefiles"
MODULEFILE="$MODULEDIR/$PKGNAME"
mkdir -p "$MODULEDIR"
cat > "$MODULEFILE" <<EoF
#%Module1.0
proc ModulesHelp { } {
  global version
  puts stderr "ALICE Modulefile for $PKGNAME $PKGVERSION-@@PKGREVISION@$PKGHASH@@"
}
set version $PKGVERSION-@@PKGREVISION@$PKGHASH@@
module-whatis "ALICE Modulefile for $PKGNAME $PKGVERSION-@@PKGREVISION@$PKGHASH@@"
# Dependencies
module load BASE/1.0
# Load Toolchain module for the current platform. Fallback on this one
regexp -- "^(.*)/.*\$" [module-info name] dummy mod_name
if { "\$mod_name" == "GCC-Toolchain" } {
  if { [regexp {^/cvmfs.*} \$ModulesCurrentModulefile dummy1 dummy2] } {
    module load Toolchain/GCC-${PKGVERSION//-*}
    if { [is-loaded Toolchain] } { continue }
  }
  set base_path \$::env(BASEDIR)
} else {
  # Loading Toolchain: autodetect prefix
  set base_path [string map "/etc/toolchain/modulefiles/ /" \$ModulesCurrentModulefile]
  set base_path [string map "/Modules/modulefiles/ /" \$base_path]
  regexp -- "^(.*)/.*/.*\$" \$base_path dummy base_path
  set base_path \$base_path/Packages
  # Load any fundamental packages we need in the runtime environment, if
  # loading off CVMFS (because there we have a grid-base-packages/default
  # symlink). Don't depend on that package directly here, so that we don't
  # rebuild our entire stack when changing what we use in grid-base-packages.
  if { [regexp {^/cvmfs.*} \$ModulesCurrentModulefile dummy1 dummy2] } {
    module load grid-base-packages/default
  }
}
# Our environment
set GCC_TOOLCHAIN_ROOT \$base_path/GCC-Toolchain/\$version
prepend-path LD_LIBRARY_PATH \$GCC_TOOLCHAIN_ROOT/lib
prepend-path LD_LIBRARY_PATH \$GCC_TOOLCHAIN_ROOT/lib64
prepend-path PATH \$GCC_TOOLCHAIN_ROOT/bin
prepend-path PATH \$GCC_TOOLCHAIN_ROOT/libexec/ccache/bin
EoF
