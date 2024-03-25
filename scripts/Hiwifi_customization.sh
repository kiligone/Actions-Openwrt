#!/bin/bash

# mbedtls
cp -v ../patches/201-Camellia-block-cipher.patch package/libs/mbedtls/patches/
# mkhash
sed -i 's/mkhash md5/echo 95238bfd570012d05891b8156dec4a28/g' include/kernel-defaults.mk

exit 0
