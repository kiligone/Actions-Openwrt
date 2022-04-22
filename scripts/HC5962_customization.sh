#!/bin/bash

# mbedtls
cp -v ../patches/201-Camellia-block-cipher.patch package/libs/mbedtls/patches/
# mkhash
sed -i 's/$(MKHASH) md5/echo 65fb974d16c7195fa4353fc4a101041e/g' include/kernel-defaults.mk

exit 0
