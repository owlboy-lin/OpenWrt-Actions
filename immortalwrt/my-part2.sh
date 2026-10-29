#!/bin/bash
#
# Modify default IP
sed -i 's/192.168.1.1/192.168.89.249/g' package/base-files/files/bin/config_generate


echo "

# # Themes
CONFIG_PACKAGE_luci-theme-argon=y

# 自动重启
CONFIG_PACKAGE_luci-app-autoreboot=y


# 关机
CONFIG_PACKAGE_luci-app-poweroff=y
CONFIG_PACKAGE_luci-app-poweroffdevice=y


# openclash
CONFIG_PACKAGE_luci-app-openclash=y


# adguardhome
CONFIG_PACKAGE_luci-app-adguardhome=y
CONFIG_PACKAGE_luci-app-adguardhome_INCLUDE_binary=y

# mosdns
CONFIG_PACKAGE_luci-app-mosdns=y


# 网络速度测试
CONFIG_PACKAGE_luci-app-netspeedtest=y

# 宽带监控
CONFIG_PACKAGE_luci-app-nlbwmon=y

# nikki
CONFIG_PACKAGE_luci-app-nikki=y


# passwall
CONFIG_PACKAGE_luci-app-passwall=y


CONFIG_PACKAGE_luci-app-passwall2=y


# luci-app-ssr-plus
CONFIG_PACKAGE_luci-app-ssr-plus=y


# quickstart
CONFIG_PACKAGE_luci-app-quickstart=y

# 分区扩容
CONFIG_PACKAGE_luci-app-partexp=y


# store
CONFIG_PACKAGE_luci-app-store=y

# luci-app-ttyd=y
CONFIG_PACKAGE_luci-app-ttyd=y


# luci-app-uugamebooster
luci-app-uugamebooster=n


# luci-app-webadmin=y
CONFIG_PACKAGE_luci-app-webadmin=y


# CONFIG_DEFAULT_autosamba=n
# CONFIG_PACKAGE_autosamba=n
# CONFIG_PACKAGE_autosamba_INCLUDE_KSMBD=n
# CONFIG_PACKAGE_luci-app-accesscontrol=n
# CONFIG_PACKAGE_luci-app-ksmbd=n
# CONFIG_PACKAGE_luci-app-arpbind=n
# CONFIG_PACKAGE_luci-app-ddns=n
# CONFIG_PACKAGE_luci-app-ddnsto=n
# CONFIG_PACKAGE_luci-app-dockerman=n
# CONFIG_PACKAGE_luci-app-nlbwmon=n
# CONFIG_PACKAGE_luci-app-netdata=n
# CONFIG_PACKAGE_luci-app-samba4=n
CONFIG_PACKAGE_luci-app-smartdns=n
CONFIG_PACKAGE_luci-app-upnp=y
# CONFIG_PACKAGE_luci-app-vsftpd=n
CONFIG_PACKAGE_luci-app-wol=y
CONFIG_PACKAGE_luci-app-vlmcsd=n
CONFIG_PACKAGE_luci-app-homeproxy=n



" >> .config