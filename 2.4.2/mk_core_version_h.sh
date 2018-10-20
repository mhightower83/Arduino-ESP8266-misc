#!/bin/bash
buildpath="${1}"
runtimeplatformpath="${2}"
version="${3}"

# I changed the original method. We now create a .txt file instead of .h And
# conditionally update the .h if the .txt file changes. This allows the build
# dependencies to work correctly. This avoids a complete rebuild of the project
# every time we compile.
# Added handy #defines for ARDUINO_ESP8266_RELEASE... macro

getcoreversion() {
    cd "${runtimeplatformpath}"
    if git_tag=`git describe --tags 2>/dev/null`; then
        echo \#define ARDUINO_ESP8266_GIT_DESC ${git_tag}
        core_version="${git_tag%%-*}"
        echo \#define ARDUINO_ESP8266_RELEASE_${core_version//./_}
        echo \#define ARDUINO_ESP8266_RELEASE \"${core_version}\"
    else
        echo \#define ARDUINO_ESP8266_GIT_DESC "unix-${version}"
    fi
}

getshortsha1() {
    shortsha1=`git --git-dir "${runtimeplatformpath}/.git" rev-parse --short=8 HEAD 2>/dev/null` || shortsha1="ffffffff"
    echo \#define ARDUINO_ESP8266_GIT_VER 0x${shortsha1}
}

mkdir -p "${buildpath}/core" || exit 1
getshortsha1 >"${buildpath}/core/core_version.txt"
getcoreversion >>"${buildpath}/core/core_version.txt"
cmp -s "${buildpath}/core/core_version.txt" "${buildpath}/core/core_version.h" || cp "${buildpath}/core/core_version.txt" "${buildpath}/core/core_version.h"

# echo "buildpath=\"${1}\""
# echo "runtimeplatformpath=\"${2}\""
# echo "version=\"${3}\""
