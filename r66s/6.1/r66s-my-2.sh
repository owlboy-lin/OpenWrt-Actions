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

# 修改openwrt登陆地址,把下面的 10.0.0.1 修改成你想要的就可以了
# sed -i 's/192.168.1.1/192.168.24.1/g' package/base-files/files/bin/config_generate
# 修改 子网掩码
# sed -i 's/255.255.255.0/255.255.0.0/g' package/base-files/files/bin/config_generate

# 修改主机名字，把 iStore OS 修改你喜欢的就行（不能纯数字或者使用中文）
# sed -i 's/OpenWrt/iStore OS/g' package/base-files/files/bin/config_generate

# 替换终端为bash
# sed -i 's/\/bin\/ash/\/bin\/bash/' package/base-files/files/etc/passwd

# ttyd 自动登录
# sed -i "s?/bin/login?/usr/libexec/login.sh?g" ${GITHUB_WORKSPACE}/openwrt/package/feeds/packages/ttyd/files/ttyd.config

sed -i 's/192.168.1.1/192.168.89.249/g' package/base-files/files/bin/config_generate


echo "



# CONFIG_DEFAULT_autosamba=n
# CONFIG_PACKAGE_autosamba=n
# CONFIG_PACKAGE_autosamba_INCLUDE_KSMBD=n
# CONFIG_PACKAGE_luci-app-ksmbd=n
# CONFIG_PACKAGE_luci-app-accesscontrol=n
# CONFIG_PACKAGE_luci-app-arpbind=n
# CONFIG_PACKAGE_luci-app-ddns=n
# CONFIG_PACKAGE_luci-app-diskman=n
# CONFIG_PACKAGE_luci-app-ipsec-vpnd=n
# CONFIG_PACKAGE_iptables-mod-tproxy=n
# CONFIG_PACKAGE_iptables-mod-extra=n
# CONFIG_PACKAGE_luci-app-openvpn=n
# CONFIG_PACKAGE_luci-app-ramfree=y
# CONFIG_PACKAGE_luci-app-samba4=n
# CONFIG_PACKAGE_luci-app-smartdns=n
# CONFIG_PACKAGE_luci-app-quickstart=n
CONFIG_PACKAGE_luci-app-upnp=y
# CONFIG_PACKAGE_luci-app-uugamebooster=n
# CONFIG_PACKAGE_luci-app-vlmcsd=n
# CONFIG_PACKAGE_luci-app-vsftpd=n
CONFIG_PACKAGE_luci-app-wol=y
# CONFIG_PACKAGE_luci-app-zerotier=n
# CONFIG_PACKAGE_swconfig=n



CONFIG_TARGET_SQUASHFS_BLOCK_SIZE=256

CONFIG_TARGET_KERNEL_PARTSIZE=128
CONFIG_TARGET_ROOTFS_PARTSIZE=900

# # Themes
CONFIG_PACKAGE_luci-theme-argon=y


# 自动重启
CONFIG_PACKAGE_luci-app-autoreboot=y


# 关机
CONFIG_PACKAGE_luci-app-poweroff=y


# openclash
CONFIG_PACKAGE_luci-app-openclash=y


# adguardhome
CONFIG_PACKAGE_luci-app-adguardhome=y
CONFIG_PACKAGE_luci-app-adguardhome_INCLUDE_binary=y

# mosdns
CONFIG_PACKAGE_luci-app-mosdns=y


# netspeedtest chmod +x /etc/init.d/netspeedtest
CONFIG_PACKAGE_luci-app-netspeedtest=y


# nikki
CONFIG_PACKAGE_luci-app-nikki=y


# 宽带监控
CONFIG_PACKAGE_luci-app-nlbwmon=y

# passwall
CONFIG_PACKAGE_luci-app-passwall=y


# luci-app-ssr-plus
CONFIG_PACKAGE_luci-app-ssr-plus=y

# quickstart
CONFIG_PACKAGE_luci-app-quickstart=y


# store
CONFIG_PACKAGE_luci-app-store=y

# luci-app-ttyd=y
CONFIG_PACKAGE_luci-app-ttyd=y

# luci-app-uugamebooster



# luci-app-turboacc
CONFIG_PACKAGE_luci-app-turboacc=y



# luci-app-webadmin=y
CONFIG_PACKAGE_luci-app-webadmin=y







" >> .config