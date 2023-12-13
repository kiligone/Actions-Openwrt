#!/bin/bash


sed -i 's/$(MKHASH) md5/echo 9c242f353867f49a96054ff8c9f2c460/g' include/kernel-defaults.mk

exit 0
