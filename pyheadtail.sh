package: PyHEADTAIL
description: PyHEADTAIL macroparticle tracking code for accelerator beams
version: "1.16.5"
tag: "1.16.5"
requires:
  - Python
  - numpy
  - cython
  - h5py
  - scipy
  # macOS: the Cython extensions are compiled with -fopenmp; Apple clang needs
  # Homebrew libomp for OpenMP (Linux uses GCC's built-in libgomp).
  - "libomp:osx"
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: GPL-3.0-or-later
---
#!/bin/bash -e
##############################
. $(bits-include PythonPipRecipe)
. $(bits-include BitsMacOS)
##############################
MODULE_OPTIONS="--bin --python"
##############################
# macOS: setup.py hardcodes -fopenmp, which Apple clang rejects. Interpose a compiler
# wrapper that rewrites it to -Xpreprocessor -fopenmp + libomp include/link, then execs
# clang. CC/CXX point pip's isolated build at it; LIBOMP_ROOT from the libomp:osx dep.
if bits_is_macos; then
  _ph_lomp="${LIBOMP_ROOT:-$(brew --prefix libomp 2>/dev/null)}"
  _ph_wrap="$(mktemp -d)"
  for _ph_pair in "cc:/usr/bin/clang" "c++:/usr/bin/clang++"; do
    _ph_name="${_ph_pair%%:*}"; _ph_real="${_ph_pair#*:}"
    cat > "${_ph_wrap}/${_ph_name}" <<EOF
#!/bin/bash
args=()
omp=0
link=1
for a in "\$@"; do
  case "\$a" in
    -fopenmp) omp=1; args+=(-Xpreprocessor -fopenmp) ;;
    -c) link=0; args+=("\$a") ;;
    *) args+=("\$a") ;;
  esac
done
if [ "\$omp" = 1 ]; then
  args+=(-I"${_ph_lomp}/include")
  [ "\$link" = 1 ] && args+=(-L"${_ph_lomp}/lib" -lomp)
fi
exec ${_ph_real} "\${args[@]}"
EOF
    chmod +x "${_ph_wrap}/${_ph_name}"
  done
  export CC="${_ph_wrap}/cc"
  export CXX="${_ph_wrap}/c++"
fi
