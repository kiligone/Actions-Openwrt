#!/bin/bash

set -ex

cp -f ../patches/312-arm64-cpuinfo-Add-model-name-in-proc-cpuinfo-for-64bit-ta.patch target/linux/generic/hack-5.15/
sed -i 's/$(MKHASH) md5/echo 83850846aeb31a278a010941bbebf326/g' include/kernel-defaults.mk

exit 0
