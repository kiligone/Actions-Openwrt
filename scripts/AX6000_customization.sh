#!/bin/bash

set -ex

cp -f ../patches/312-arm64-cpuinfo-Add-model-name-in-proc-cpuinfo-for-64bit-ta.patch target/linux/generic/hack-6.12/
sed -i 's/$(MKHASH) md5/echo f0a7348f9cb959e1bf4d0447669b031e/g' include/kernel-defaults.mk

exit 0
