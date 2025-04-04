#!/usr/bin/env sh
set -e
DIR=~/Downloads
MIRROR=https://vstsagentpackage.azureedge.net/agent

dl() {
    local ver=$1
    local os=$2
    local arch=$3
    local archive_type=${4:-tar.gz}

    local platform="${os}-${arch}"

    local file="vsts-agent-${platform}-${ver}.${archive_type}"
    local lfile=$DIR/$file
    local url="$MIRROR/$ver/$file"

    if [ ! -e $lfile ];
    then
        curl -sSLf -o $lfile $url
    fi
    printf "    # %s\n" $url
    printf "    %s: sha256:%s\n" $platform $(sha256sum $lfile | awk '{print $1}')
}

dl_ver() {
    local ver=$1

    printf "  '%s':\n" $ver

    dl $ver win x64 zip
    dl $ver win x86 zip
    dl $ver osx x64
    dl $ver osx arm64
    dl $ver linux x64
    dl $ver linux musl-x64
    dl $ver linux arm
    dl $ver linux arm64
    dl $ver linux musl-arm64
}

# https://github.com/microsoft/azure-pipelines-agent/releases
dl_ver ${1:-4.253.0}
