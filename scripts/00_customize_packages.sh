#!/bin/bash


# Access Control
svn export https://github.com/immortalwrt/luci/branches/openwrt-23.05/applications/luci-app-accesscontrol feeds/luci/applications/luci-app-accesscontrol
ln -sf ../../../feeds/luci/applications/luci-app-accesscontrol ./package/feeds/luci/luci-app-accesscontrol


# arpbind
svn export https://github.com/immortalwrt/luci/branches/openwrt-23.05/applications/luci-app-arpbind feeds/luci/applications/luci-app-arpbind
ln -sf ../../../feeds/luci/applications/luci-app-arpbind ./package/feeds/luci/luci-app-arpbind


# AutoCore
svn export https://github.com/immortalwrt/immortalwrt/branches/openwrt-23.05/package/emortal/autocore package/new/autocore
svn export https://github.com/immortalwrt/immortalwrt/branches/openwrt-23.05/package/utils/mhz package/new/mhz
rm -rf feeds/luci/modules/luci-base
svn export https://github.com/immortalwrt/luci/branches/openwrt-23.05/modules/luci-base feeds/luci/modules/luci-base
rm -rf feeds/luci/modules/luci-mod-status
svn export https://github.com/immortalwrt/luci/branches/openwrt-23.05/modules/luci-mod-status feeds/luci/modules/luci-mod-status


#automount
svn export https://github.com/coolsnowwolf/lede/trunk/package/lean/automount package/new/automount 
svn export https://github.com/coolsnowwolf/lede/trunk/package/lean/ntfs3-mount package/new/ntfs3-mount


#cpufreq
svn export https://github.com/immortalwrt/luci/branches/openwrt-23.05/applications/luci-app-cpufreq feeds/luci/applications/luci-app-cpufreq
ln -sf ../../../feeds/luci/applications/luci-app-cpufreq ./package/feeds/luci/luci-app-cpufreq

# DDNS
svn export https://github.com/immortalwrt/packages/branches/openwrt-23.05/net/ddns-scripts_aliyun package/new/ddns-scripts_aliyun
svn export https://github.com/immortalwrt/packages/branches/openwrt-23.05/net/ddns-scripts_dnspod package/new/ddns-scripts_dnspod


# dnsmasq
rm -rf package/network/services/dnsmasq
svn export https://github.com/immortalwrt/immortalwrt/branches/openwrt-23.05/package/network/services/dnsmasq package/network/services/dnsmasq


# Filetransfer
#svn export https://github.com/immortalwrt/luci/branches/openwrt-23.05/applications/luci-app-filetransfer feeds/luci/applications/luci-app-filetransfer
#ln -sf ../../../feeds/luci/applications/luci-app-filetransfer ./package/feeds/luci/luci-app-filetransfer
svn export https://github.com/immortalwrt/luci/branches/openwrt-23.05/libs/luci-lib-fs feeds/luci/libs/luci-lib-fs
ln -sf ../../../feeds/luci/libs/luci-lib-fs ./package/feeds/luci/luci-lib-fs



# FullCone nat for nftables
curl -sSL https://github.com/coolsnowwolf/lede/files/11473486/952-add-net-conntrack-events-support-multiple-registrant.patch -o target/linux/generic/hack-5.15/952-add-net-conntrack-events-support-multiple-registrant.patch
svn export https://github.com/coolsnowwolf/lede/trunk/target/linux/generic/hack-5.15/982-add-bcm-fullconenat-support.patch target/linux/generic/hack-5.15/982-add-bcm-fullconenat-support.patch
# fullconenat-nft
svn export https://github.com/immortalwrt/immortalwrt/branches/openwrt-23.05/package/network/utils/fullconenat-nft package/network/utils/fullconenat-nft
# libnftnl
rm -rf ./package/libs/libnftnl
svn export https://github.com/immortalwrt/immortalwrt/branches/openwrt-23.05/package/libs/libnftnl package/libs/libnftnl
# nftables
rm -rf ./package/network/utils/nftables/
svn export https://github.com/immortalwrt/immortalwrt/branches/openwrt-23.05/package/network/utils/nftables package/network/utils/nftables
# firewall4
rm -rf ./package/network/config/firewall4
svn export https://github.com/immortalwrt/immortalwrt/branches/openwrt-23.05/package/network/config/firewall4 package/network/config/firewall4
# patch luci
patch -d feeds/luci -p1 -i ../../../patches/fullconenat-luci.patch

#upnp
cp ../patches/miniupnpd_getifaddr.patch feeds/package/net/miniupnpd/patches 



#mbedtls
rm -rf ./package/libs/mbedtls
svn export https://github.com/immortalwrt/immortalwrt/branches/openwrt-23.05/package/libs/mbedtls package/libs/mbedtls

# IPSEC
#svn export https://github.com/coolsnowwolf/luci/trunk/applications/luci-app-ipsec-server feeds/luci/applications/luci-app-ipsec-server
#ln -sf ../../../feeds/luci/applications/luci-app-ipsec-server ./package/feeds/luci/luci-app-ipsec-server


#OLED
svn export -q https://github.com/NateLol/luci-app-oled/trunk package/new/luci-app-oled


# OpenClash
svn export -q https://github.com/vernesong/OpenClash/trunk/luci-app-openclash package/new/luci-app-openclash


# Realtek RTL8125/8125B/8126A
svn export -q https://github.com/sbwml/package_kernel_r8125/trunk package/new/r8125


# Realtek R8152
svn export -q https://github.com/immortalwrt/immortalwrt/branches/openwrt-23.05/package/kernel/r8152 package/new/r8152


# Realtek 8192EU
svn export -q https://github.com/immortalwrt/immortalwrt/branches/openwrt-23.05/package/kernel/rtl8192eu package/new/rtl8192eu


# Release Ram
svn export https://github.com/immortalwrt/luci/branches/openwrt-23.05/applications/luci-app-ramfree feeds/luci/applications/luci-app-ramfree
ln -sf ../../../feeds/luci/applications/luci-app-ramfree ./package/feeds/luci/luci-app-ramfree

# Scheduled Reboot
svn export https://github.com/immortalwrt/luci/branches/openwrt-23.05/applications/luci-app-autoreboot feeds/luci/applications/luci-app-autoreboot
ln -sf ../../../feeds/luci/applications/luci-app-autoreboot ./package/feeds/luci/luci-app-autoreboot




# vlmcsd
svn export https://github.com/immortalwrt/luci/branches/openwrt-23.05/applications/luci-app-vlmcsd feeds/luci/applications/luci-app-vlmcsd
ln -sf ../../../feeds/luci/applications/luci-app-vlmcsd ./package/feeds/luci/luci-app-vlmcsd
svn export https://github.com/immortalwrt/packages/branches/openwrt-23.05/net/vlmcsd package/new/vlmcsd



# default settings and translation
cp -rf ../default-settings package/new/



#ipv6-helper
svn export -q https://github.com/immortalwrt/immortalwrt/branches/openwrt-23.05/package/emortal/ipv6-helper package/new/ipv6-helper


#uugamebooster
svn export -q https://github.com/immortalwrt/luci/branches/openwrt-23.05/applications/luci-app-uugamebooster package/new/luci-app-uugamebooster
svn export -q https://github.com/immortalwrt/packages/branches/openwrt-23.05/net/uugamebooster package/new/uugamebooster




#luci-app-aliyundrive-webdav
svn export https://github.com/coolsnowwolf/packages/trunk/multimedia/aliyundrive-webdav feeds/packages/multimedia/aliyundrive-webdav
ln -sf ../../../feeds/packages/multimedia/aliyundrive-webdav ./package/feeds/packages/aliyundrive-webdav
svn export https://github.com/coolsnowwolf/luci/trunk/applications/luci-app-aliyundrive-webdav feeds/luci/applications/luci-app-aliyundrive-webdav
ln -sf ../../../feeds/luci/applications/luci-app-aliyundrive-webdav ./package/feeds/luci/luci-app-aliyundrive-webdav

#nginxmanage
svn export https://github.com/kiddin9/openwrt-packages/trunk/luci-app-nginx-manager package/new/luci-app-nginx-manager


#autoshare-samba
svn export https://github.com/kiddin9/openwrt-packages/trunk/autoshare-samba package/new/autoshare-samba







#theme
svn export https://github.com/kiddin9/openwrt-packages/trunk/luci-theme-edge package/new/luci-theme-edge
exit 0
