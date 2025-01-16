#!/bin/sh -e

if test -x /usr/bin/dnf; then
    echo Installing prerequisites via dnf...
    dnf -y install epel-release
    dnf -y install zlib-devel bzip2-devel xz-devel curl-devel openssl-devel

elif test -x /usr/bin/yum; then
    if yum -y install epel-release; then
        echo Installing prerequisites via yum...
        yum -y install zlib-devel bzip2-devel xz-devel curl-devel openssl-devel
    else
        echo Installing non-test prerequisites via yum...
        yum -y install zlib-devel bzip2-devel xz-devel curl-devel openssl-devel
    fi

elif test -d /etc/dpkg; then
    echo Installing prerequisites via apt-get...
    apt-get update
    apt-get install -y --no-install-recommends --no-install-suggests libcurl4-openssl-dev libssl-dev zlib1g-dev libbz2-dev liblzma-dev

elif test -x /sbin/apk; then
    echo Installing non-test prerequisites via apk...
    apk update
    apk add zlib-dev bzip2-dev xz-dev curl-dev openssl-dev

else
    echo No package manager detected
fi
