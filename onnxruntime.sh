package: onnxruntime
description: ONNX Runtime cross-platform ML model inference engine
version: "1.24.4"
source: https://github.com/microsoft/onnxruntime
tag: "v%(version)s"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/%(name)s-%(version)s.tar.gz
requires:
  - Python
  - six
  - wheel
  - blas
  - numpy
  - onnx
  - torch
  - packaging
  - coloredlogs
  - sympy
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: MIT
---
#!/bin/bash -e
##############################
# PythonRecipe gives PYTHON_EXE/SITE_PACKAGES and a PYTHONPATH from deps' site-
# packages (numpy/onnx/packaging/wheel). We override the build steps: setup.py
# only packages an already-built tree, so drive tools/ci_build/build.py instead.
. $(bits-include PythonRecipe)
##############################
MODULE_OPTIONS="--bin --lib --python"
##############################
_ORT_CONFIG="Release"
_ORT_BUILDDIR="build"
##############################
function Make() {
  # Drive onnxruntime's build (CMake configure, compile, capi info, python wheel)
  # with the bits Python so the wheel sees our deps via PYTHONPATH.
  # --allow_running_as_root is Linux-only in build.py, so pass it on non-Darwin
  # only. getconf replaces nproc (which is absent on macOS).
  local _extra=()
  [ "$(uname)" != Darwin ] && _extra+=(--allow_running_as_root)
  "${PYTHON_EXE}" tools/ci_build/build.py \
    --build_dir "${_ORT_BUILDDIR}" \
    --config "${_ORT_CONFIG}" \
    --update --build \
    --parallel "${JOBS:-$(getconf _NPROCESSORS_ONLN 2>/dev/null || echo 4)}" \
    --skip_submodule_sync \
    --skip_tests \
    --build_shared_lib \
    --build_wheel \
    --compile_no_warning_as_error \
    "${_extra[@]}" \
    --cmake_extra_defines \
      CMAKE_INSTALL_PREFIX="${INSTALLROOT}" \
      onnxruntime_BUILD_UNIT_TESTS=OFF \
      FETCHCONTENT_TRY_FIND_PACKAGE_MODE=NEVER
}
function MakeInstall() {
  mkdir -p "${SITE_PACKAGES}"
  # Install the C++ shared library + headers (CMAKE_INSTALL_PREFIX was set above).
  cmake --install "${_ORT_BUILDDIR}/${_ORT_CONFIG}"
  # Install the python wheel that --build_wheel produced.
  local _whl
  _whl=$(ls -t "${_ORT_BUILDDIR}/${_ORT_CONFIG}/dist/"*.whl 2>/dev/null | head -1)
  if [ -z "${_whl}" ]; then
    echo "onnxruntime: no wheel found under ${_ORT_BUILDDIR}/${_ORT_CONFIG}/dist" >&2
    return 1
  fi
  "${PYTHON_EXE}" -m pip install \
    --no-deps --no-build-isolation --ignore-installed \
    --root=/ --prefix="${INSTALLROOT}" "${_whl}"
}
function PostInstall() {
  printf 'prepend-path ROOT_INCLUDE_PATH $PKG_ROOT/include/onnxruntime\n' >> "$INSTALLROOT/etc/modulefiles/$PKGNAME"
}
