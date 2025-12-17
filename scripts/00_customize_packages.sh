#!/bin/bash
merge_package(){
    # 参数1是分支名,参数2是库地址,参数3是子路径。所有文件下载到openwrt/package/openwrt-packages路径。
    # 同一个仓库下载多个文件夹直接在后面跟文件名或路径，空格分开。
    branch=$1 curl=$2 && shift 2
    rootdir=$(pwd)
    localdir=package/new
    [ -d $localdir ] || mkdir -p $localdir
    tmpdir=$(mktemp -d) || exit 1
    git clone -b $branch --depth 1 --filter=blob:none --sparse $curl $tmpdir
    cd $tmpdir
    git sparse-checkout init --cone
    git sparse-checkout set $@
    mv -f $@ $rootdir/$localdir
	cd $rootdir && rm -rf $tmpdir
}


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
cp -rf ../immortalwrt/package/emortal/cpufreq package/new/

# DDNS
cp -rf ../immortalwrt-packages/net/ddns-scripts_aliyun package/new/
cp -rf ../immortalwrt-packages/net/ddns-scripts_dnspod package/new/


# dnsmasq
rm -rf package/network/services/dnsmasq
cp -rf ../immortalwrt/package/network/services/dnsmasq package/network/services/


# Filetransfer nginx-manager
#svn export https://github.com/immortalwrt/luci/branches/openwrt-23.05/applications/luci-app-filetransfer feeds/luci/applications/luci-app-filetransfer
#ln -sf ../../../feeds/luci/applications/luci-app-filetransfer ./package/feeds/luci/luci-app-filetransfer
#svn export https://github.com/immortalwrt/luci/branches/openwrt-23.05/libs/luci-lib-fs feeds/luci/libs/luci-lib-fs
#ln -sf ../../../feeds/luci/libs/luci-lib-fs ./package/feeds/luci/luci-lib-fs
merge_package master https://github.com/kiddin9/openwrt-packages luci-app-filetransfer luci-app-nginx-manager
cp -rf ../immortalwrt-luci/libs/luci-lib-fs package/new/



# FullCone nat for nftables
curl -sSL https://github.com/coolsnowwolf/lede//target/linux/generic/hack-6.6/952-add-net-conntrack-events-support-multiple-registrant.patch -o target/linux/generic/hack-6.6//952-add-net-conntrack-events-support-multiple-registrant.patch
# disable KERNEL_WERROR
sed -i 's,imply KERNEL_WERROR,#imply KERNEL_WERROR,g' toolchain/gcc/Config.version
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

#smartdns
rm -rf ./feeds/packages/net/smartdns
rm -rf ./feeds/luci/applications/luci-app-smartdns
git clone -b master --depth 1 --single-branch https://github.com/pymumu/luci-app-smartdns package/new/luci-app-smartdns
git clone -b master --depth 1 --single-branch https://github.com/pymumu/openwrt-smartdns package/new/openwrt-smartdns


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




#autoshare-samba
cp -rf ../lede/package/lean/autosamba package/new/







#theme
git clone -b master --depth 1 --single-branch https://github.com/kiddin9/luci-theme-edge package/new/luci-theme-edge

# fix include luci.mk
find package/new/ -type f -name Makefile -exec sed -i 's,../../luci.mk,$(TOPDIR)/feeds/luci/luci.mk,g' {} +
