#
# Copyright (C) 2007-2021 OpenWrt.org
# Copyright (C) 2010 Vertical Communications
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=default-settings
PKG_VERSION:=1
PKG_RELEASE:=1

PKG_LICENSE:=GPL-3.0

include $(INCLUDE_DIR)/package.mk

# full IPv6 support with a DHCPv6 client: odhcp6c
# RA & DHCPv6 Server: odhcpd-ipv6only
# IPv6 firewall: ip6tables
# Web interface to configure IPv6: luci-proto-ipv6
# FullCone Nat: iptables-mod-fullconenat
# mwan3: kmod-macvlan

define Package/default-settings
	SECTION:=luci
	CATEGORY:=LuCI
	TITLE:=LuCI support for Default Settings
	PKGARCH:=all
	DEPENDS:=+ip6tables \
		+iptables-mod-fullconenat \
		+kmod-macvlan \
		+libustream-wolfssl \
		+luci \
		+luci-compat \
		+luci-proto-ipv6 \
		+odhcp6c \
		+odhcpd-ipv6only \
		+zram-swap \
		+@LUCI_LANG_zh_Hans
endef

define Build/Compile
endef

define Package/default-settings/install
	$(INSTALL_DIR) $(1)/etc/uci-defaults
	$(INSTALL_BIN) ./files/zzz-default-settings $(1)/etc/uci-defaults/99-default-settings
	$(INSTALL_DIR) $(1)/usr/lib/lua/luci/i18n
	po2lmo ./i18n/default.zh-cn.po $(1)/usr/lib/lua/luci/i18n/default.zh-cn.lmo
	po2lmo ./i18n/more.zh-cn.po $(1)/usr/lib/lua/luci/i18n/more.zh-cn.lmo
endef

$(eval $(call BuildPackage,default-settings))
