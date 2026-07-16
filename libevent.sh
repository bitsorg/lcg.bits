package: libevent
description: libevent asynchronous event notification library
version: "2.1.11"
source: https://github.com/libevent/libevent
tag: "release-%(version)s"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/%(name)s-%(version)s.tar.gz
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: BSD-3-Clause
---
#!/bin/bash -e
##############################
. $(bits-include AutoToolsRecipe)
. $(bits-include BitsMacOS)
##############################
MODULE_OPTIONS="--bin --lib"
##############################
function Configure() {
  if bits_is_macos; then
      # macOS: allow flat-namespace lazy resolution so the extra/pthreads/openssl sub-libs link against libevent_core
      export LDFLAGS="$(bits_macos_undefined_ldflags)${LDFLAGS:+ ${LDFLAGS}}"
      # macOS: force off Linux/Solaris syscall/backend probes clang false-positives, so configure picks kqueue + fallbacks
      export ac_cv_func_pipe2=no ac_cv_func_accept4=no \
           ac_cv_func_epoll_create=no ac_cv_func_epoll_create1=no ac_cv_func_epoll_ctl=no \
           ac_cv_header_sys_epoll_h=no \
           ac_cv_func_eventfd=no ac_cv_header_sys_eventfd_h=no \
           ac_cv_func_signalfd=no \
           ac_cv_func_timerfd_create=no \
           ac_cv_func_port_create=no ac_cv_header_port_h=no
  fi
  ./configure --prefix $INSTALLROOT
}
