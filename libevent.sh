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
##############################
MODULE_OPTIONS="--bin --lib"
##############################
function Configure() {
  # macOS: libevent's extra / pthreads / openssl sub-libraries reference
  # libevent_core symbols without linking core. Linux (ELF) resolves these at
  # load time, but macOS's two-level namespace rejects undefined symbols in a
  # dylib ("Undefined symbols for architecture arm64: _event_pending,
  # _evthread_lock_fns_, _evutil_closesocket, ..."). Allow flat-namespace lazy
  # resolution so the sub-dylibs link, matching the ELF behaviour.
  [ "$(uname)" = Darwin ] && export LDFLAGS="-Wl,-undefined,dynamic_lookup${LDFLAGS:+ ${LDFLAGS}}"
  # macOS lacks the Linux-only syscalls (pipe2, accept4) and the Linux/Solaris
  # event backends (epoll, eventfd, signalfd, timerfd, evport). Under modern
  # clang, libevent's autoconf probes false-positive several of these, so it
  # compiles backends whose headers don't exist on macOS ("call to undeclared
  # function 'pipe2'", "'sys/epoll.h' file not found", "'port.h' file not
  # found"). macOS uses the kqueue backend; force every Linux/Solaris-only probe
  # off so configure selects kqueue + the portable pipe()/accept() fallbacks. No
  # effect on Linux, where these genuinely exist.
  if [ "$(uname)" = Darwin ]; then
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
