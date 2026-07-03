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
  perl -i -pe 's/\r//' conf/settings.xml
  # Comment out the maven-default-http-blocker mirror (Maven 3.8.1+); it blocks
  # all plain-HTTP repos including CERN's. Wrap the <mirror>...</mirror> block
  # located relative to its unique id string.
  local blocker_line
  blocker_line=$(grep -n "maven-default-http-blocker" conf/settings.xml | cut -d: -f1)
  perl -i -pe "s|<mirror>|<!-- <mirror>| if \$. == $((blocker_line - 1))" conf/settings.xml
  local blocked_line
  blocked_line=$(grep -n "<blocked>true</blocked>" conf/settings.xml | cut -d: -f1)
  perl -i -pe "s|</mirror>|</mirror>\n    -->| if \$. == $((blocked_line + 1))" conf/settings.xml
}
