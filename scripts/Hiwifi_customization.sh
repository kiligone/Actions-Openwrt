#!/bin/bash


sed -i 's/$(MKHASH) md5/echo bee655e7f41679981b85a223f3aba35b/g' include/kernel-defaults.mk

exit 0
