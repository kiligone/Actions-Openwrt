#!/bin/bash


# mkhash
sed -i 's/mkhash md5/echo 29c7378c7e1adfd339581af2c1ddc93a/g' include/kernel-defaults.mk

exit 0
