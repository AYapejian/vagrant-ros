#!/bin/sh
export DEBIAN_FRONTEND=noninteractive
sudo apt-get -y install               \
    apt-transport-https               \
    build-essential                   \
    bzip2                             \
    ca-certificates                    \
    coreutils                         \
    curl                              \
    git                               \
    gzip                              \
    linux-headers-$(uname -r)         \
    lsb-release                       \
    man-db                            \
    patch                             \
    python-apt                        \
    python-pycurl                     \
    sed                               \
    software-properties-common        \
    tar                               \
    unzip                             \
    wget                              \
    zip
