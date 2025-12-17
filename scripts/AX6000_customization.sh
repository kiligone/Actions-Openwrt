#!/bin/bash

set -ex

cp -f ../patches/312-arm64-cpuinfo-Add-model-name-in-proc-cpuinfo-for-64bit-ta.patch target/linux/generic/hack-6.6/
sed -i 's/$(MKHASH) md5/echo 6a9e125268c43e0bae8cecb014c8ab03/g' include/kernel-defaults.mk

exit 0
