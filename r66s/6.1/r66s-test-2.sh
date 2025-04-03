
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

echo "

CONFIG_DEFAULT_autosamba=n
CONFIG_PACKAGE_autosamba=n
CONFIG_PACKAGE_autosamba_INCLUDE_KSMBD=n
CONFIG_PACKAGE_luci-app-ksmbd=n
CONFIG_PACKAGE_luci-app-accesscontrol=n
CONFIG_PACKAGE_luci-app-arpbind=n
CONFIG_PACKAGE_luci-app-ddns=n
CONFIG_PACKAGE_luci-app-diskman=n
CONFIG_PACKAGE_luci-app-ipsec-vpnd=n
CONFIG_PACKAGE_iptables-mod-tproxy=n
CONFIG_PACKAGE_iptables-mod-extra=n
CONFIG_PACKAGE_luci-app-openvpn=n
CONFIG_PACKAGE_luci-app-ramfree=y
CONFIG_PACKAGE_luci-app-samba4=n
CONFIG_PACKAGE_luci-app-quickstart=n
CONFIG_PACKAGE_luci-app-upnp=n
CONFIG_PACKAGE_luci-app-uugamebooster=n
CONFIG_PACKAGE_luci-app-vlmcsd=n
CONFIG_PACKAGE_luci-app-vsftpd=n
CONFIG_PACKAGE_luci-app-wol=n
CONFIG_PACKAGE_luci-app-zerotier=n
CONFIG_PACKAGE_swconfig=n

# 额外组件
# CONFIG_GRUB_IMAGES=y
# CONFIG_VMDK_IMAGES=y

# CONFIG_TARGET_ROOTFS_EXT4FS=y
# CONFIG_TARGET_EXT4_RESERVED_PCT=0
# CONFIG_TARGET_EXT4_BLOCKSIZE_4K=y
# # CONFIG_TARGET_EXT4_BLOCKSIZE_2K is not set
# # CONFIG_TARGET_EXT4_BLOCKSIZE_1K is not set
# CONFIG_TARGET_EXT4_BLOCKSIZE=4096
# # CONFIG_TARGET_EXT4_JOURNAL is not set

# CONFIG_TARGET_SQUASHFS_BLOCK_SIZE=1024

# 固件大小
# CONFIG_TARGET_KERNEL_PARTSIZE=1024
# CONFIG_TARGET_ROOTFS_PARTSIZE=1024

# CONFIG_TARGET_SQUASHFS_BLOCK_SIZE=512

CONFIG_TARGET_KERNEL_PARTSIZE=128
CONFIG_TARGET_ROOTFS_PARTSIZE=256

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

# 宽带监控
CONFIG_PACKAGE_luci-app-nlbwmon=y

# passwall
CONFIG_PACKAGE_luci-app-passwall=y


CONFIG_PACKAGE_luci-app-passwall2=y



# quickstart



# store
CONFIG_PACKAGE_luci-app-store=y

# luci-app-ttyd=y
CONFIG_PACKAGE_luci-app-ttyd=y

# luci-app-uugamebooster



# luci-app-turboacc
CONFIG_PACKAGE_luci-app-turboacc=y

# luci-app-vssr
CONFIG_PACKAGE_luci-app-vssr=n


# luci-app-webadmin=y
CONFIG_PACKAGE_luci-app-webadmin=y







" >> .config