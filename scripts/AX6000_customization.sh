#!/bin/bash

set -ex

cp -f ../patches/312-arm64-cpuinfo-Add-model-name-in-proc-cpuinfo-for-64bit-ta.patch target/linux/generic/hack-6.6/
sed -i 's/$(MKHASH) md5/echo 43cbcde0affaaf16309bb4ab09799e9a/g' include/kernel-defaults.mk

exit 0
