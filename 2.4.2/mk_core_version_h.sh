#!/bin/bash
buildpath="${1}"
runtimeplatformpath="${2}"
version="${3}"

# I changed the original method. We now create a .txt file instead of .h And
# conditionally update the .h if the .txt file changes. This allows the build
# dependencies to work correctly. This avoids a complete rebuild of the project
# every time we compile.
mkdir -p "${buildpath}/core" && echo \#define ARDUINO_ESP8266_GIT_VER 0x`git --git-dir "${runtimeplatformpath}/.git" rev-parse --short=8 HEAD 2>/dev/null || echo ffffffff` >"${buildpath}/core/core_version.txt"
mkdir -p "${buildpath}/core" && echo \#define ARDUINO_ESP8266_GIT_DESC `cd "${runtimeplatformpath}"; git describe --tags 2>/dev/null || echo unix-${version}` >>"${buildpath}/core/core_version.txt"
cmp -s "${buildpath}/core/core_version.txt" "${buildpath}/core/core_version.h" || cp "${buildpath}/core/core_version.txt" "${buildpath}/core/core_version.h"

# echo "buildpath=\"${1}\""
# echo "runtimeplatformpath=\"${2}\""
# echo "version=\"${3}\""
