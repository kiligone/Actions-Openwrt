#!/bin/bash


# Access Control
cp -rf ../immortalwrt-luci/applications/luci-app-accesscontrol package/new/


# arpbind
cp -rf ../immortalwrt-luci/applications/luci-app-arpbind package/new/


# AutoCore
cp -rf ../immortalwrt/package/emortal/autocore package/new/
cp -rf ../immortalwrt/package/utils/mhz package/utils/
rm -rf feeds/luci/modules/luci-base
cp -rf ../immortalwrt-luci/modules/luci-base feeds/luci/modules
rm -rf feeds/luci/modules/luci-mod-status
cp -rf ../immortalwrt-luci/modules/luci-mod-status feeds/luci/modules/


#automount
cp -rf ../lede/package/lean/automount package/new/
cp -rf ../lede/package/lean/ntfs3-mount package/new/


#cpufreq
cp -rf ../immortalwrt-luci/applications/luci-app-cpufreq package/new/

# DDNS
cp -rf ../immortalwrt-packages/net/ddns-scripts_aliyun package/new/
cp -rf ../immortalwrt-packages/net/ddns-scripts_dnspod package/new/


# dnsmasq
rm -rf package/network/services/dnsmasq
cp -rf ../immortalwrt/package/network/services/dnsmasq package/network/services/


# Filetransfer
#svn export https://github.com/immortalwrt/luci/branches/openwrt-23.05/applications/luci-app-filetransfer feeds/luci/applications/luci-app-filetransfer
#ln -sf ../../../feeds/luci/applications/luci-app-filetransfer ./package/feeds/luci/luci-app-filetransfer
cp -rf ../immortalwrt-luci/libs/luci-lib-fs feeds/luci/libs/



# FullCone nat for nftables
curl -sSL https://github.com/coolsnowwolf/lede/files/11473486/952-add-net-conntrack-events-support-multiple-registrant.patch -o target/linux/generic/hack-5.15/952-add-net-conntrack-events-support-multiple-registrant.patch
cp -rf ../lede/target/linux/generic/hack-5.15/982-add-bcm-fullconenat-support.patch target/linux/generic/hack-5.15/982-add-bcm-fullconenat-support.patch
# fullconenat-nft
cp -rf ../immortalwrt/package/network/utils/fullconenat-nft package/network/utils/
# libnftnl
rm -rf ./package/libs/libnftnl
cp -rf ../immortalwrt/package/libs/libnftnl package/libs/
# nftables
rm -rf ./package/network/utils/nftables/
cp -rf ../immortalwrt/package/network/utils/nftables package/network/utils/
# firewall4
rm -rf ./package/network/config/firewall4
cp -rf ../immortalwrt/package/network/config/firewall4 package/network/config/
# patch luci
patch -d feeds/luci -p1 -i ../../../patches/fullconenat-luci.patch




#mbedtls
rm -rf ./package/libs/mbedtls
cp -rf ../immortalwrt/package/libs/mbedtls package/libs/

# IPSEC
#svn export https://github.com/coolsnowwolf/luci/trunk/applications/luci-app-ipsec-server feeds/luci/applications/luci-app-ipsec-server
#ln -sf ../../../feeds/luci/applications/luci-app-ipsec-server ./package/feeds/luci/luci-app-ipsec-server


#OLED
git clone -b master --depth 1 --single-branch https://github.com/NateLol/luci-app-oled package/new/luci-app-oled


# OpenClash
git clone -b master --depth 1 --single-branch https://github.com/vernesong/OpenClash package/new/luci-app-openclash


# Realtek RTL8125/8125B/8126A
git clone -b master --depth 1 --single-branch https://github.com/sbwml/package_kernel_r8125 package/new/r8125


# Realtek R8152
cp -rf ../immortalwrt/package/kernel/r8152 package/new/


# Realtek 8192EU
#svn export -q https://github.com/immortalwrt/immortalwrt/branches/openwrt-23.05/package/kernel/rtl8192eu package/new/rtl8192eu


# Release Ram
cp -rf ../immortalwrt-luci/applications/luci-app-ramfree package/new/

# Scheduled Reboot
cp -rf ../immortalwrt-luci/applications/luci-app-autoreboot package/new/




# vlmcsd
cp -rf ../immortalwrt-luci/applications/luci-app-vlmcsd package/new/
cp -rf ../immortalwrt-packages/net/vlmcsd package/new/



# default settings and translation
cp -rf ../default-settings package/new/



#ipv6-helper
cp -rf ../immortalwrt/package/emortal/ipv6-helper package/new/


#uugamebooster
cp -rf ../immortalwrt-luci/applications/luci-app-uugamebooster package/new/
cp -rf ../immortalwrt-packages/net/uugamebooster package/new/




#luci-app-aliyundrive-webdav
git clone -b main --depth 1 --single-branch https://github.com/messense/aliyundrive-webdav package/new/aliyundrive-webdav

#nginxmanage
git clone -b master --depth 1 --single-branch https://github.com/sundaqiang/openwrt-packages package/new/luci-app-nginx-manager


#autoshare-samba
cp ../lede/package/lean/autoshare-samba package/new/







#theme
git clone -b master --depth 1 --single-branch https://github.com/kiddin9/luci-theme-edge package/new/luci-theme-edge

# fix include luci.mk
find package/new/ -type f -name Makefile -exec sed -i 's,../../luci.mk,$(TOPDIR)/feeds/luci/luci.mk,g' {} +
