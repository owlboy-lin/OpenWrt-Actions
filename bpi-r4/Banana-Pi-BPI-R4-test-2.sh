echo "

# 额外组件

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


# CONFIG_DEFAULT_autosamba is not set
# CONFIG_PACKAGE_autosamba is not set
# CONFIG_PACKAGE_autosamba_INCLUDE_KSMBD is not set
# CONFIG_PACKAGE_luci-app-accesscontrol is not set
# CONFIG_PACKAGE_luci-app-ksmbd is not set
# CONFIG_PACKAGE_luci-app-arpbind is not set
# CONFIG_PACKAGE_luci-app-ddns is not set
# CONFIG_PACKAGE_luci-app-samba4 is not set
# CONFIG_PACKAGE_luci-app-upnp is not set
# CONFIG_PACKAGE_luci-app-vsftpd is not set
# CONFIG_PACKAGE_luci-app-wol is not set
CONFIG_PACKAGE_swconfig=y




" >> .config
