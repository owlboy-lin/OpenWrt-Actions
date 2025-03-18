# sed -i 's/192.168.1.1/192.168.23.1/g' package/base-files/files/bin/config_generate
# sed -i "s/192\.168\.[0-9]*\.[0-9]*/192.168.23.1/g" $(find ./feeds/luci/modules/luci-mod-system/ -type f -name "flash.js")
# sed -i 's/ImmortalWrt/OpenWrt/g' package/base-files/files/bin/config_generate
# sed -i 's/ImmortalWrt/OpenWrt/g' package/network/config/wifi-scripts/files/lib/wifi/mac80211.uc
# mv $GITHUB_WORKSPACE/patch/banner package/base-files/files/etc/banner

# #完全删除luci版本
# sed -i "s/+ ' \/ ' : '') + (luciversion ||/:/g" feeds/luci/modules/luci-mod-status/htdocs/luci-static/resources/view/status/include/10_system.js
# #添加编译日期
# sed -i "s/%C/\/ Complied on $(date +"%Y.%m.%d")/g" package/base-files/files/usr/lib/os-release
# sed -i "s/%C/\/ Complied on $(date +"%Y.%m.%d")/g" package/base-files/files/etc/openwrt_release

#下载5g模块
#git clone --depth=1 https://github.com/Siriling/5G-Modem-Support.git package/5g-modem
#rm -rf feeds/packages/net/quectel-cm

# git clone --depth 1 https://github.com/xiaorouji/openwrt-passwall2.git package/passwall2
# git clone --depth 1 https://github.com/xiaorouji/openwrt-passwall-packages.git package/passwall-packages
# git clone --depth 1 https://github.com/rufengsuixing/luci-app-adguardhome.git package/luci-app-adguardhome

# find ./ | grep Makefile | grep v2ray-geodata | xargs rm -f
# find ./ | grep Makefile | grep mosdns | xargs rm -f

# git clone https://github.com/sbwml/luci-app-mosdns -b v5 package/mosdns
# git clone https://github.com/sbwml/v2ray-geodata package/v2ray-geodata

echo "

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


# 固件大小
# CONFIG_TARGET_KERNEL_PARTSIZE=1024
# CONFIG_TARGET_ROOTFS_PARTSIZE=1024

CONFIG_TARGET_SQUASHFS_BLOCK_SIZE=512



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


CONFIG_PACKAGE_luci-app-passwall2=n

# luci-app-ssr-plus
CONFIG_PACKAGE_luci-app-ssr-plus=y


# quickstart
CONFIG_PACKAGE_luci-app-quickstart=n


# store
CONFIG_PACKAGE_luci-app-store=y

# luci-app-ttyd=y
CONFIG_PACKAGE_luci-app-ttyd=y

# luci-app-uugamebooster
CONFIG_PACKAGE_luci-app-uugamebooster=n

# luci-app-vssr
CONFIG_PACKAGE_luci-app-vssr=y

# luci-app-webadmin=y
CONFIG_PACKAGE_luci-app-webadmin=y


CONFIG_DEFAULT_autosamba=n
CONFIG_PACKAGE_autosamba=n
CONFIG_PACKAGE_autosamba_INCLUDE_KSMBD=n
CONFIG_PACKAGE_luci-app-accesscontrol=n
CONFIG_PACKAGE_luci-app-ksmbd=n
CONFIG_PACKAGE_luci-app-arpbind=n
CONFIG_PACKAGE_luci-app-ddns=n
CONFIG_PACKAGE_luci-app-samba4=n
CONFIG_PACKAGE_luci-app-upnp=n
CONFIG_PACKAGE_luci-app-vsftpd=n
CONFIG_PACKAGE_luci-app-wol=n
# CONFIG_PACKAGE_swconfig=y




" >> .config
