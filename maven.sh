package: maven
description: Apache Maven project management and comprehension tool
version: "3.8.5"
tag: "3.8.5"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/apache-maven-3.8.5-bin.tar.gz
requires:
  - java
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: Apache-2.0
---
#!/bin/bash -e
##############################
. $(bits-include BinaryRecipe)
##############################
MODULE_OPTIONS="--bin"
##############################
function Configure() {
  # settings.xml is distributed with CRLF line endings; strip CR first so
  # that all subsequent sed patterns match cleanly.
  sed -i 's/\r//' conf/settings.xml
  # Comment out the maven-default-http-blocker mirror (added in Maven 3.8.1+).
  # It unconditionally blocks all plain-HTTP repositories, including CERN's.
  # Locate the unique id string and target the <mirror> tag exactly one line
  # above it; then close the comment after the following </mirror>.
  local blocker_line
  blocker_line=$(grep -n "maven-default-http-blocker" conf/settings.xml | cut -d: -f1)
  sed -i "$((blocker_line - 1))s|<mirror>|<!-- <mirror>|" conf/settings.xml
  local blocked_line
  blocked_line=$(grep -n "<blocked>true</blocked>" conf/settings.xml | cut -d: -f1)
  sed -i "$((blocked_line + 1))s|</mirror>|</mirror>\n    -->|" conf/settings.xml
}
