#!/bin/bash


# Access Control
svn export https://github.com/immortalwrt/luci/branches/openwrt-21.02/applications/luci-app-accesscontrol feeds/luci/applications/luci-app-accesscontrol
ln -sf ../../../feeds/luci/applications/luci-app-accesscontrol ./package/feeds/luci/luci-app-accesscontrol


# arpbind
svn export https://github.com/immortalwrt/luci/branches/openwrt-21.02/applications/luci-app-arpbind feeds/luci/applications/luci-app-arpbind
ln -sf ../../../feeds/luci/applications/luci-app-arpbind ./package/feeds/luci/luci-app-arpbind




# DDNS
svn export https://github.com/immortalwrt/packages/branches/openwrt-21.02/net/ddns-scripts_aliyun package/new/ddns-scripts_aliyun
svn export https://github.com/immortalwrt/packages/branches/openwrt-21.02/net/ddns-scripts_dnspod package/new/ddns-scripts_dnspod

# dnsmasq: add filter aaa option
cp -rf ../patches/910-add-filter-aaaa-option-support.patch package/network/services/dnsmasq/patches/
patch -p1 -i ../patches/dnsmasq-add-filter-aaaa-option.patch
patch -d feeds/luci -p1 -i ../../../patches/filter-aaaa-luci.patch


# Filetransfer
svn export https://github.com/immortalwrt/luci/branches/openwrt-21.02/applications/luci-app-filetransfer feeds/luci/applications/luci-app-filetransfer
ln -sf ../../../feeds/luci/applications/luci-app-filetransfer ./package/feeds/luci/luci-app-filetransfer
svn export https://github.com/immortalwrt/luci/branches/openwrt-21.02/libs/luci-lib-fs feeds/luci/libs/luci-lib-fs
ln -sf ../../../feeds/luci/libs/luci-lib-fs ./package/feeds/luci/luci-lib-fs



# FullCone
svn export https://github.com/immortalwrt/immortalwrt/branches/openwrt-21.02/package/network/utils/fullconenat package/network/fullconenat
wget -P target/linux/generic/hack-5.4/ https://raw.githubusercontent.com/immortalwrt/immortalwrt/openwrt-21.02/target/linux/generic/hack-5.4/952-net-conntrack-events-support-multiple-registrant.patch
patch -d feeds/luci -p1 -i ../../../patches/fullconenat-luci.patch
svn export https://github.com/immortalwrt/immortalwrt/branches/openwrt-21.02/package/network/config/firewall/patches package/network/config/firewall/patches


#cpuinfo
patch -d ./ -p1 -i ../patches/status.patch

# IPSEC
svn export https://github.com/immortalwrt/luci/branches/openwrt-21.02/applications/luci-app-ipsec-vpnd feeds/luci/applications/luci-app-ipsec-vpnd
ln -sf ../../../feeds/luci/applications/luci-app-ipsec-vpnd ./package/feeds/luci/luci-app-ipsec-vpnd

# Kernel: fix IPv6 package drop when using software flow offload
curl -sSL https://github.com/openwrt/openwrt/pull/9940.patch | patch -p1


# OpenClash
svn export https://github.com/vernesong/OpenClash/trunk/luci-app-openclash package/new/luci-app-openclash

# add kmod-inet-diag package
curl -sSL https://github.com/openwrt/openwrt/commit/efc8aff.patch | patch -p1


# Realtek RTL8811CU/RTL8821CU
svn export https://github.com/immortalwrt/immortalwrt/branches/openwrt-21.02/package/kernel/rtl8821cu package/new/rtl8821cu

# Realtek RTL8812AU/21AU
svn export https://github.com/immortalwrt/immortalwrt/branches/openwrt-21.02/package/kernel/rtl8812au-ac package/new/rtl8812au-ac

# Realtek 8812BU/8822BU
svn export https://github.com/immortalwrt/immortalwrt/branches/openwrt-21.02/package/kernel/rtl88x2bu package/new/rtl88x2bu

# Realtek R8125
svn export https://github.com/immortalwrt/immortalwrt/branches/openwrt-21.02/package/kernel/r8125 package/new/r8125


# Realtek R8152
svn export https://github.com/immortalwrt/immortalwrt/branches/openwrt-21.02/package/kernel/r8152 package/new/r8152


# Realtek R8168
svn export https://github.com/immortalwrt/immortalwrt/branches/openwrt-21.02/package/kernel/r8168 package/new/r8168


# Realtek 8192EU
svn export https://github.com/immortalwrt/immortalwrt/branches/openwrt-21.02/package/kernel/rtl8192eu package/new/rtl8192eu


# Release Ram
svn export https://github.com/immortalwrt/luci/branches/openwrt-21.02/applications/luci-app-ramfree feeds/luci/applications/luci-app-ramfree
ln -sf ../../../feeds/luci/applications/luci-app-ramfree ./package/feeds/luci/luci-app-ramfree

# Scheduled Reboot
svn export https://github.com/immortalwrt/luci/branches/openwrt-21.02/applications/luci-app-autoreboot feeds/luci/applications/luci-app-autoreboot
ln -sf ../../../feeds/luci/applications/luci-app-autoreboot ./package/feeds/luci/luci-app-autoreboot



#UPNP
rm -rf ./feeds/packages/net/miniupnpd
svn export https://github.com/coolsnowwolf/packages/trunk/net/miniupnpd feeds/packages/net/miniupnpd

# upx & ucl
svn co https://github.com/coolsnowwolf/lede/trunk/tools/ucl tools/ucl
svn co https://github.com/coolsnowwolf/lede/trunk/tools/upx tools/upx
sed -i '/builddir dependencies/i\tools-y += ucl upx' tools/Makefile
sed -i '/builddir dependencies/a\$(curdir)/upx/compile := $(curdir)/ucl/compile' tools/Makefile


# vlmcsd
svn export https://github.com/immortalwrt/luci/branches/openwrt-21.02/applications/luci-app-vlmcsd feeds/luci/applications/luci-app-vlmcsd
ln -sf ../../../feeds/luci/applications/luci-app-vlmcsd ./package/feeds/luci/luci-app-vlmcsd
svn export https://github.com/immortalwrt/packages/branches/openwrt-21.02/net/vlmcsd package/new/vlmcsd



# default settings and translation
cp -rv ../default-settings package/new/



#dnsforwarder
svn export https://github.com/coolsnowwolf/packages/trunk/net/dnsforwarder feeds/packages/net/dnsforwarder
ln -sf ../../../feeds/packages/net/dnsforwarder ./package/feeds/packages/dnsforwarder

#dnsproxy
svn export https://github.com/kiddin9/openwrt-packages/trunk/dnsproxy package/new/dnsproxy

#luci-app-turboacc
svn export https://github.com/kiddin9/openwrt-packages/trunk/luci-app-turboacc package/new/luci-app-turboacc
#patch -d ./ -p1 -i ../patches/turboacc.patch

#shortcut-fe
svn export https://github.com/kiddin9/openwrt-packages/trunk/shortcut-fe package/new/shortcut-fe

#ipv6-helper
svn export https://github.com/coolsnowwolf/lede/trunk/package/lean/ipv6-helper package/new/ipv6-helper


#uugamebooster
svn export https://github.com/kiddin9/openwrt-packages/trunk/luci-app-uugamebooster package/new/luci-app-uugamebooster
svn export https://github.com/kiddin9/openwrt-packages/trunk/uugamebooster package/new/uugamebooster

#luci-app-webadmin
#svn export https://github.com/coolsnowwolf/lede/trunk/package/lean/luci-app-webadmin package/new/luci-app-webadmin

#luci-app-onliner
svn export https://github.com/rufengsuixing/luci-app-onliner/trunk package/new/luci-app-onliner




#luci-app-aliyundrive-webdav
svn export https://github.com/coolsnowwolf/packages/trunk/multimedia/aliyundrive-webdav feeds/packages/multimedia/aliyundrive-webdav
ln -sf ../../../feeds/packages/multimedia/aliyundrive-webdav ./package/feeds/packages/aliyundrive-webdav
svn export https://github.com/coolsnowwolf/luci/trunk/applications/luci-app-aliyundrive-webdav feeds/luci/applications/luci-app-aliyundrive-webdav
ln -sf ../../../feeds/luci/applications/luci-app-aliyundrive-webdav ./package/feeds/luci/luci-app-aliyundrive-webdav

#nginxmanage
svn export https://github.com/kiddin9/openwrt-packages/trunk/luci-app-nginx-manager package/new/luci-app-nginx-manager

#eqos
svn export https://github.com/kiddin9/openwrt-packages/trunk/luci-app-eqos package/new/luci-app-eqos

svn export https://github.com/kiddin9/openwrt-packages/trunk/luci-app-cifs-mount package/new/luci-app-cifs-mount
svn export https://github.com/kiddin9/openwrt-packages/trunk/autoshare-samba package/new/autoshare-samba
svn export https://github.com/kiddin9/openwrt-packages/trunk/pdnsd-alt package/new/pdnsd-alt
svn export https://github.com/immortalwrt/immortalwrt/branches/openwrt-21.02/package/emortal/automount package/new/automount 


# max conntrack
sed -i 's,16384,65536,g' package/kernel/linux/files/sysctl-nf-conntrack.conf

#theme
svn export https://github.com/kiddin9/openwrt-packages/trunk/luci-theme-edge package/new/luci-theme-edge
exit 0
