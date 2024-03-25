#!/bin/bash

# mbedtls
cp -v ../patches/201-Camellia-block-cipher.patch package/libs/mbedtls/patches/
# mkhash
sed -i 's/mkhash md5/echo bee655e7f41679981b85a223f3aba35b/g' include/kernel-defaults.mk

exit 0
