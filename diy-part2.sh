#!/bin/bash
#
# Copyright (c) 2019-2020 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part2.sh
# Description: OpenWrt DIY script part 2 (After Update feeds)
#

# Modify default IP
sed -i 's/192.168.1.1/192.168.31.5/g' package/base-files/files/bin/config_generate
sed -i 's/mkhash md5/echo 29c7378c7e1adfd339581af2c1ddc93a/g' include/kernel-defaults.mk
