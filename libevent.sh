package: libevent
description: libevent asynchronous event notification library
version: "2.1.11"
tag: "2.1.11"
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
  # macOS: the extra/pthreads/openssl sub-libs reference libevent_core symbols
  # without linking core; allow flat-namespace lazy resolution so the sub-dylibs
  # link (the two-level namespace would reject the undefined symbols).
  bits_is_macos && export LDFLAGS="$(bits_macos_undefined_ldflags)${LDFLAGS:+ ${LDFLAGS}}"
  # macOS: clang autoconf probes false-positive Linux/Solaris syscalls and event
  # backends (pipe2, accept4, epoll, eventfd, signalfd, timerfd, evport). Force
  # every such probe off so configure picks kqueue + pipe()/accept() fallbacks.
  if bits_is_macos; then
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
