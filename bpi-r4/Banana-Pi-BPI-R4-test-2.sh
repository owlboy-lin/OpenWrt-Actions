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

# rm -rf package/istore/luci-app-store

# iStore
# git clone --depth=1 -b main https://github.com/linkease/istore.git package/istore
# ./scripts/feeds update istore
# ./scripts/feeds install -d y -p istore luci-app-store

# git clone --depth=1 -b master https://github.com/linkease/nas-packages.git package/nas-packages
# git clone --depth=1 -b main https://github.com/linkease/nas-packages-luci.git package/nas-luci
# mv package/nas-packages/network/services/* package/nas-packages/
# rm -rf package/nas-packages/network


# git clone --depth 1 https://github.com/fw876/helloworld.git package/helloworld
# git clone --depth 1 https://github.com/vernesong/OpenClash.git package/OpenClash
# git clone --depth 1 https://github.com/morytyann/OpenWrt-mihomo.git package/mihomo
# git clone --depth 1 https://github.com/xiaorouji/openwrt-passwall.git package/passwall
# git clone -b main --depth 1 https://github.com/xiaorouji/openwrt-passwall2.git package/passwall2
# t clone --depth 1 https://github.com/xiaorouji/openwrt-passwall-packages.git package/passwall-packages



# rm -rf feeds/packages/lang/golang
# git clone https://github.com/sbwml/packages_lang_golang -b 24.x feeds/packages/lang/golang



# rm -rf feeds/packages/devel/gn
# rm -rf feeds/luci/applications/{luci-app-passwall,luci-app-openclash}

# rm -rf feeds/packages/net/adguardhome
# git clone --depth 1 https://github.com/xiaorouji/openwrt-passwall2.git package/passwall2
# git clone --depth 1 https://github.com/xiaorouji/openwrt-passwall-packages.git package/passwall-packages
# git clone --depth 1 https://github.com/rufengsuixing/luci-app-adguardhome.git package/luci-app-adguardhome



# find ./ | grep Makefile | grep v2ray-geodata | xargs rm -f
# find ./ | grep Makefile | grep mosdns | xargs rm -f
# git clone https://github.com/sbwml/luci-app-mosdns -b v5 package/mosdns
# git clone https://github.com/sbwml/v2ray-geodata package/v2ray-geodata

# git clone --depth=1 https://github.com/kenzok8/small-package.git package/kz8-small
# mv package/kz8-small/adguardhome package/adguardhome
# mv package/kz8-small/luci-app-adguardhome package/luci-app-adguardhome
# mv package/kz8-small/luci-app-ikoolproxy package/luci-app-ikoolproxy
# mv package/kz8-small/luci-app-partexp package/luci-app-partexp
# mv package/kz8-small/luci-app-wrtbwmon package/luci-app-wrtbwmon
# mv package/kz8-small/wrtbwmon package/wrtbwmon
# mv package/kz8-small/luci-app-netspeedtest package/luci-app-netspeedtest
# mv package/kz8-small/homebox package/homebox
# mv package/kz8-small/luci-app-poweroff package/luci-app-poweroff
# rm -rf package/kz8-small

# git clone --depth 1 -b openwrt-23.05 https://github.com/immortalwrt/luci package/imm23luci
# mv package/imm23luci/applications/luci-app-adbyby-plus package/luci-app-adbyby-plus
# rm -rf package/imm23luci
# git clone --depth 1 -b openwrt-23.05 https://github.com/immortalwrt/packages package/imm23packages
# mv package/imm23packages/net/adbyby package/adbyby
# rm -rf package/imm23packages


# rm -rf feeds/packages/lang/golang
# rm -rf feeds/packages/devel/gn
# rm -rf feeds/packages/net/{chinadns-ng,dns2socks,dns2tcp,geoview,hysteria,ipt2socks,microsocks,naiveproxy,pdnsd-alt,shadowsocks-rust,shadowsocksr-libev,simple-obfs,sing-box,ssocks,tcping,trojan*,tuic-client,v2ray*,xray*,mosdns}
# rm -rf feeds/luci/applications/{luci-app-passwall,luci-app-openclash}
# git clone --depth 1 https://github.com/sbwml/packages_lang_golang -b 24.x feeds/packages/lang/golang
# git clone --depth 1 https://github.com/vernesong/OpenClash.git  package/openclash
# git clone --depth 1 https://github.com/xiaorouji/openwrt-passwall.git package/passwall
# git clone --depth 1 https://github.com/xiaorouji/openwrt-passwall2.git package/passwall2
# git clone --depth 1 https://github.com/xiaorouji/openwrt-passwall-packages.git package/passwall-packages
# git clone --depth 1 https://github.com/sbwml/luci-app-mosdns.git package/mosdns
# git clone --depth 1 https://github.com/rufengsuixing/luci-app-adguardhome.git package/luci-app-adguardhome
# git clone --depth 1 https://github.com/fw876/helloworld.git package/helloworld



# 添加自定义软件包

# 自定义定制选项
NET="package/base-files/files/bin/config_generate"
sed -i "s/192\.168\.[0-9]*\.[0-9]*/192.168.24.9/g" $(find ./feeds/luci/modules/luci-mod-system/ -type f -name "flash.js")
NET3="package/base-files/luci2/bin/config_generate"
# sed -i 's/192.168.1.1/192.168.24.1/g' package/base-files/luci2/bin/config_generate
# ZZZ="package/emortal/default-settings/files/99-default-settings"


#
sed -i "s#192.168.1.1#192.168.24.9#g" $NET       
sed -i "s#192.168.1.1#192.168.24.9#g" $NET3                                              # 定制默认IP
# sed -i "s#ImmortalWrt#ImmortalWrt-X86#g" $NET                                          # 修改默认名称为 ImmortalWrt-X86
# sed -i 's@.*CYXluq4wUazHjmCDBCqXF*@#&@g' $ZZZ                                          # 取消系统默认密码
# echo "uci set luci.main.mediaurlbase=/luci-static/argon" >> $ZZZ                      # 设置默认主题(如果编译可会自动修改默认主题的，有可能会失效)

# ●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●● #

# BUILDTIME=$(TZ=UTC-8 date "+%Y.%m.%d") && sed -i "s/\(_('Firmware Version'), *\)/\1 ('ONE build $BUILDTIME @ ') + /" feeds/luci/modules/luci-mod-status/htdocs/luci-static/resources/view/status/include/10_system.js              # 增加自己个性名称
# sed -i "s@list listen_https@# list listen_https@g" package/network/services/uhttpd/files/uhttpd.config               # 停止监听443端口
# sed -i '/exit 0/i\ethtool -s eth0 speed 2500 duplex full' package/base-files/files//etc/rc.local               # 强制显示2500M和全双工（默认PVE下VirtIO不识别） ImmortalWrt固件内不显示端口状态，可以关闭

# ●●●●●●●●●●●●●●●●●●●●●●●●定制部分●●●●●●●●●●●●●●●●●●●●●●●● #




echo "

# 额外组件
CONFIG_TARGET_SQUASHFS_BLOCK_SIZE=512



# # Themes
CONFIG_PACKAGE_luci-theme-argon=y


# 自动重启
CONFIG_PACKAGE_luci-app-autoreboot=y


# 关机
# CONFIG_PACKAGE_luci-app-poweroff=y


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


# luci-app-ssr-plus
CONFIG_PACKAGE_luci-app-ssr-plus=y


# quickstart
# CONFIG_PACKAGE_luci-app-quickstart=n


# store
CONFIG_PACKAGE_luci-app-store=n

# luci-app-ttyd=y
CONFIG_PACKAGE_luci-app-ttyd=y

# luci-app-turboacc
CONFIG_PACKAGE_luci-app-turboacc=y

# luci-app-uugamebooster
# CONFIG_PACKAGE_luci-app-uugamebooster=y

# luci-app-vssr
CONFIG_PACKAGE_luci-app-vssr=y

# luci-app-webadmin=y
CONFIG_PACKAGE_luci-app-webadmin=y

# luci-app-wrtbwmo
CONFIG_PACKAGE_luci-app-wrtbwmon=n



" >> .config
