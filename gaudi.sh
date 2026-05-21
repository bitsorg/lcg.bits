package: Gaudi
description: Gaudi software framework for HEP data processing applications
version: "%(tag_basename)s"
tag: "v40r2"
source: https://gitlab.cern.ch/gaudi/Gaudi.git
license: Apache-2.0
requires:
  - CMake
  - Boost
  - Python
  - ROOT
  - clhep
  - XercesC
  - rangev3
  - cppgsl
  - xenv
  - six
  - fmt
  - pytest
  - pytest_cov
  - PyYAML
  - jsonmcpp
  - Catch2
  - networkx
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
---
#!/bin/bash -e
##############################
. $(bits-include CMakeRecipe)
##############################
MODULE_OPTIONS="--bin --lib --cmake --python"
##############################
function Prepare() {
  # Fix GaudiToolbox.cmake: use .confdb2.dat extension (avoids gdbm dependency
  # on platforms where Python is built without _gdbm), and use #!/bin/bash
  # (merge_confdb2_parts shebang must match the shell that supports the script).
  python3 - <<'PYEOF'
import re, pathlib

cmake_file = pathlib.Path("cmake/GaudiToolbox.cmake")
text = cmake_file.read_text()

# .confdb2) -> .confdb2.dat) in the Linux else branch output file assignment
text = text.replace(
    "${CMAKE_BINARY_DIR}/${PROJECT_NAME}.confdb2)",
    "${CMAKE_BINARY_DIR}/${PROJECT_NAME}.confdb2.dat)"
)
# CONTENT "#!/bin/sh -> CONTENT "#!/bin/bash
text = text.replace('CONTENT "#!/bin/sh', 'CONTENT "#!/bin/bash')
# file(WRITE ... "#!/bin/sh\n -> file(WRITE ... "#!/bin/bash\n
text = text.replace('file(WRITE ${CMAKE_BINARY_DIR}/run "#!/bin/sh\n',
                    'file(WRITE ${CMAKE_BINARY_DIR}/run "#!/bin/bash\n')

cmake_file.write_text(text)
print("GaudiToolbox.cmake patched")

# Fix merge_confdb2_parts: guard dbm.gnu import so builds without _gdbm work
script = pathlib.Path("GaudiKernel/scripts/merge_confdb2_parts")
src = script.read_text()

old = (
    "    import dbm\n"
    "    import dbm.gnu\n"
    "    dbm._defaultmod = dbm.gnu\n"
)
new = (
    "    import dbm\n"
    "    try:\n"
    "        import dbm.gnu\n"
    "        dbm._defaultmod = dbm.gnu\n"
    "    except ImportError:\n"
    "        pass  # gdbm not compiled in; use default backend\n"
)

if old in src:
    script.write_text(src.replace(old, new))
    print("merge_confdb2_parts patched")
else:
    print("merge_confdb2_parts: pattern not found, skipping")
PYEOF
}
##############################
function Configure() {
  cmake "${SOURCEDIR}" \
      -DCMAKE_INSTALL_PREFIX="${INSTALLROOT}" \
      -DCMAKE_BUILD_TYPE=Release \
      -DCMAKE_CXX_STANDARD=20 \
      -DCMAKE_FIND_FRAMEWORK=LAST \
      -DGAUDI_USE_DOXYGEN=OFF \
      ${CPPGSL_ROOT:+-DCPPGSL_INCLUDE_DIR="${CPPGSL_ROOT}/include"} \
      ${RANGEV3_ROOT:+-DRANGEV3_INCLUDE_DIR="${RANGEV3_ROOT}/include"} \
      ${ROOT_ROOT:+-DROOT_INCLUDE_DIR="${ROOT_ROOT}/include"} \
      -DGAUDI_USE_HEPPDT=OFF \
      -DGAUDI_USE_AIDA=OFF \
      -DGAUDI_USE_GPERFTOOLS=FALSE \
      -DBoost_NO_BOOST_CMAKE=FALSE
}
