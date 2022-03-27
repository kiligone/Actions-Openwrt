#!/bin/bash

# mbedtls
cp -f ../patches/201-Camellia-block-cipher.patch package/libs/mbedtls/patches/
# mkhash
# sed -i 's/mkhash md5/echo ecc7515846d9a85938da6124aee98749/g' include/kernel-defaults.mk

exit 0
