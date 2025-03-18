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

# 添加新的主题
# git clone https://github.com/kenzok8/luci-theme-ifit.git package/lean/luci-theme-ifit

# 添加常用软件包
# git clone https://github.com/kenzok8/openwrt-packages.git package/openwrt-packages

# 删除默认密码
# sed -i "/CYXluq4wUazHjmCDBCqXF/d" package/lean/default-settings/files/zzz-default-settings

# 取消bootstrap为默认主题
#sed -i 's/luci-theme-bootstrap/luci-theme-argon/g' feeds/luci/collections/luci/Makefile

# 修改 WiFi 名称
# sed -i 's/OpenWrt/OpenWrt/g' package/kernel/mac80211/files/lib/wifi/mac80211.sh

# 默认打开 WiFi
# sed -i 's/disabled=1/disabled=0/g' package/kernel/mac80211/files/lib/wifi/mac80211.sh

# Configure pppoe connection
#uci set network.wan.proto=pppoe
#uci set network.wan.username='yougotthisfromyour@isp.su'
#uci set network.wan.password='yourpassword'

# 移除重复软件包
# rm -rf feeds/luci/themes/luci-theme-argon

# Themes
# git clone -b 18.06 https://github.com/jerrykuku/luci-theme-argon.git package/lean/luci-theme-argon
# git clone -b 18.06 https://github.com/jerrykuku/luci-theme-argon.git lpackage/uci-theme-argon
# echo 'src-git argon https://github.com/jerrykuku/luci-theme-argon' >>feeds.conf.default
# git clone -b 18.06 https://github.com/jerrykuku/luci-app-argon-config.git package/luci-app-argon-config
# echo 'src-git argon-config https://github.com/jerrykuku/luci-app-argon-config' >>feeds.conf.default

# 添加额外软件包


# 科学上网插件


# 科学上网插件依赖



# openclash
# svn export https://github.com/kenzok8/openwrt-packages/luci-app-openclash  package/luci-app-openclash
# svn export https://github.com/kiddin9/openwrt-packages/trunk/luci-app-openclash  package/luci-app-openclash
# 加入OpenClash核心
# chmod -R a+x $GITHUB_WORKSPACE/preset-clash-core.sh
# if [ "$1" = "rk33xx" ]; then
#     $GITHUB_WORKSPACE/preset-clash-core.sh arm64
# elif [ "$1" = "rk35xx" ]; then
#     $GITHUB_WORKSPACE/preset-clash-core.sh arm64
# elif [ "$1" = "x86" ]; then
#     $GITHUB_WORKSPACE/preset-clash-core.sh amd64
# fi

# adguardhome
# svn export https://github.com/kenzok8/openwrt-packages/luci-app-adguardhome package/luci-app-adguardhome
# svn export https://github.com/kenzok8/openwrt-packages/adguardhome package/adguardhome
# svn export https://github.com/kiddin9/openwrt-packages/trunk/luci-app-adguardhome package/luci-app-adguardhome
# svn export https://github.com/kiddin9/openwrt-packages/trunk/adguardhome package/adguardhome

# mosdns
# svn export https://github.com/kenzok8/openwrt-packages/luci-app-mosdns package/luci-app-mosdns
# svn export https://github.com/kenzok8/openwrt-packages/mosdns package/mosdns
# svn export https://github.com/kenzok8/openwrt-packages/v2dat package/v2dat
# svn export https://github.com/kiddin9/openwrt-packages/trunk/luci-app-mosdns package/luci-app-mosdns
# svn export https://github.com/kiddin9/openwrt-packages/trunk/mosdns package/mosdns
# svn export https://github.com/kiddin9/openwrt-packages/trunk/v2dat package/v2dat

# sed -i 's/192.168.1.1/192.168.89.249/g' package/base-files/files/bin/config_generate
# sed -i "s/192\.168\.[0-9]*\.[0-9]*/192.168.89.249/g" $(find ./feeds/luci/modules/luci-mod-system/ -type f -name "flash.js")
# sed -i 's/192.168.1.1/192.168.89.249/g' package/base-files/luci2/bin/config_generate
# sed -i 's/LEDE/OpenWrt/g' package/base-files/files/bin/config_generate
# sed -i 's/LEDE/OpenWrt/g' package/base-files/luci2/bin/config_generate
# sed -i 's/LEDE/OpenWrt/g' package/kernel/mac80211/files/lib/wifi/mac80211.sh
# #sed -i "s/luci-theme-bootstrap/luci-theme-design/g" $(find ./feeds/luci/collections/ -type f -name "Makefile")

# sed -i '/openwrt_release/d' package/lean/default-settings/files/zzz-default-settings
# sed -i '/tencent.com/d' package/lean/default-settings/files/zzz-default-settings
# sed -i '/shadow/d' package/lean/default-settings/files/zzz-default-settings
# mv $GITHUB_WORKSPACE/patch/banner package/base-files/files/etc/banner
# mv $GITHUB_WORKSPACE/patch/lean/199-diy.sh package/base-files/files/etc/uci-defaults/zz-diy.sh

# git clone --depth 1 https://github.com/fw876/helloworld.git package/helloworld
# git clone --depth 1 https://github.com/vernesong/OpenClash.git  package/openclash
# git clone --depth 1 https://github.com/xiaorouji/openwrt-passwall-packages.git package/passwall-packages
# git clone --depth 1 https://github.com/xiaorouji/openwrt-passwall.git package/luci-app-passwall
# git clone --depth 1 https://github.com/xiaorouji/openwrt-passwall2.git package/luci-app-passwall2
#rm -rf feeds/packages/lang/golang
#git clone https://github.com/kenzok8/golang feeds/packages/lang/golang

# iStore
git clone --depth 1 -b main https://github.com/linkease/istore.git package/istore
# git clone --depth 1 -b master https://github.com/linkease/nas-packages.git package/nas-packages
# git clone --depth 1 -b main https://github.com/linkease/nas-packages-luci.git package/nas-luci
# mv package/nas-packages/network/services/* package/nas-packages/
# rm -rf package/nas-packages/network

#下载5g模块
#git clone --depth 1 https://github.com/Siriling/5G-Modem-Support.git package/5g-modem
#sed -i 's/移动通信模组/通信模组/g' package/5g-modem/luci-app-modem/po/zh-cn/modem.po
#sed -i 's/移动通信模组/通信模组/g' package/5g-modem/luci-app-modem/po/zh_Hans/modem.po
#sed -i 's/\"network\"/\"modem\"/g' package/5g-modem/luci-app-modem/luasrc/controller/modem.lua


rm -rf feeds/packages/net/adguardhome
rm -rf feeds/luci/applications/{luci-app-adguardhome,luci-app-mosdns}
# #adguardhome
# git clone -b 2023.10 --depth 1 https://github.com/XiaoBinin/luci-app-adguardhome.git package/luci-app-adguardhome
# git clone https://github.com/rufengsuixing/luci-app-adguardhome package/luci-app-adguardhome
# git clone --depth 1 https://github.com/kenzok78/luci-app-adguardhome package/luci-app-adguardhome

git clone --depth=1 https://github.com/kenzok8/small-package.git package/kz8-small
mv package/kz8-small/adguardhome package/adguardhome
mv package/kz8-small/luci-app-adguardhome package/luci-app-adguardhome
# mv package/kz8-small/luci-app-ikoolproxy package/luci-app-ikoolproxy
# mv package/kz8-small/luci-app-partexp package/luci-app-partexp
# mv package/kz8-small/luci-app-wrtbwmon package/luci-app-wrtbwmon
# mv package/kz8-small/wrtbwmon package/wrtbwmon
mv package/kz8-small/luci-app-netspeedtest package/luci-app-netspeedtest
mv package/kz8-small/homebox package/homebox
mv package/kz8-small/luci-app-poweroff package/luci-app-poweroff
rm -rf package/kz8-small

# # #mosdns
find ./ | grep Makefile | grep v2ray-geodata | xargs rm -f
find ./ | grep Makefile | grep mosdns | xargs rm -f

git clone https://github.com/sbwml/luci-app-mosdns -b v5 package/luci-app-mosdns
git clone https://github.com/sbwml/v2ray-geodata package/v2ray-geodata

# git clone --depth 1 -b lua https://github.com/sbwml/luci-app-alist package/alist
# rm -rf package/alist/alist
# rm -rf feeds/luci/themes/luci-theme-argon
# git clone -b 18.06 --depth 1 https://github.com/jerrykuku/luci-theme-argon.git feeds/luci/themes/luci-theme-argon

#UA2F校园网
# git clone --depth 1 https://github.com/lucikap/luci-app-ua2f.git package/luci-app-ua2f
# git clone --depth 1 https://github.com/Zxilly/UA2F.git package/UA2F
#git clone https://github.com/EOYOHOO/UA2F.git package/UA2F
#git clone https://github.com/EOYOHOO/rkp-ipid.git package/rkp-ipid
#rm -rf feeds/packages/net/ua2f

# 添加自定义软件包

# 自定义定制选项
NET="package/base-files/files/bin/config_generate"
sed -i "s/192\.168\.[0-9]*\.[0-9]*/192.168.89.249/g" $(find ./feeds/luci/modules/luci-mod-system/ -type f -name "flash.js")
NET3="package/base-files/luci2/bin/config_generate"
# sed -i 's/192.168.1.1/192.168.24.1/g' package/base-files/luci2/bin/config_generate
# ZZZ="package/emortal/default-settings/files/99-default-settings"


#
sed -i "s#192.168.1.1#192.168.89.249#g" $NET       
sed -i "s#192.168.1.1#192.168.89.249#g" $NET3                                                    # 定制默认IP
# sed -i "s#ImmortalWrt#ImmortalWrt-X86#g" $NET                                          # 修改默认名称为 ImmortalWrt-X86
# sed -i 's@.*CYXluq4wUazHjmCDBCqXF*@#&@g' $ZZZ                                          # 取消系统默认密码
# echo "uci set luci.main.mediaurlbase=/luci-static/argon" >> $ZZZ                      # 设置默认主题(如果编译可会自动修改默认主题的，有可能会失效)

# ●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●● #

# BUILDTIME=$(TZ=UTC-8 date "+%Y.%m.%d") && sed -i "s/\(_('Firmware Version'), *\)/\1 ('ONE build $BUILDTIME @ ') + /" feeds/luci/modules/luci-mod-status/htdocs/luci-static/resources/view/status/include/10_system.js              # 增加自己个性名称
# sed -i "s@list listen_https@# list listen_https@g" package/network/services/uhttpd/files/uhttpd.config               # 停止监听443端口
# sed -i '/exit 0/i\ethtool -s eth0 speed 2500 duplex full' package/base-files/files//etc/rc.local               # 强制显示2500M和全双工（默认PVE下VirtIO不识别） ImmortalWrt固件内不显示端口状态，可以关闭

# ●●●●●●●●●●●●●●●●●●●●●●●●定制部分●●●●●●●●●●●●●●●●●●●●●●●● #



# ================ 网络设置 =======================================

# cat >> $ZZZ <<-EOF
# # 设置网络-旁路由模式
# uci set network.lan.gateway='192.168.89.248'                     # 旁路由设置 IPv4 网关
# uci set network.lan.dns='223.5.5.5 119.29.29.29'            # 旁路由设置 DNS(多个DNS要用空格分开)
# uci set dhcp.lan.ignore='1'                                  # 旁路由关闭DHCP功能
# uci delete network.lan.type                                  # 旁路由桥接模式-禁用
# uci set network.lan.delegate='0'                             # 去掉LAN口使用内置的 IPv6 管理(若用IPV6请把'0'改'1')
# uci set dhcp.@dnsmasq[0].filter_aaaa='0'                     # 禁止解析 IPv6 DNS记录(若用IPV6请把'1'改'0')

# # 设置防火墙-旁路由模式
# uci set firewall.@defaults[0].syn_flood='0'                  # 禁用 SYN-flood 防御
# uci set firewall.@defaults[0].flow_offloading='0'           # 禁用基于软件的NAT分载
# uci set firewall.@defaults[0].flow_offloading_hw='0'       # 禁用基于硬件的NAT分载
# uci set firewall.@defaults[0].fullcone='0'                   # 禁用 FullCone NAT
# uci set firewall.@defaults[0].fullcone6='0'                  # 禁用 FullCone NAT6
# uci set firewall.@zone[0].masq='1'                             # 启用LAN口 IP 动态伪装

# # 旁路IPV6需要全部禁用
# uci del network.lan.ip6assign                                 # IPV6分配长度-禁用
# uci del dhcp.lan.ra                                             # 路由通告服务-禁用
# uci del dhcp.lan.dhcpv6                                        # DHCPv6 服务-禁用
# uci del dhcp.lan.ra_management                               # DHCPv6 模式-禁用

# # 如果有用IPV6的话,可以使用以下命令创建IPV6客户端(LAN口)（去掉全部代码uci前面#号生效）
# uci set network.ipv6=interface
# uci set network.ipv6.proto='dhcpv6'
# uci set network.ipv6.ifname='@lan'
# uci set network.ipv6.reqaddress='try'
# uci set network.ipv6.reqprefix='auto'
# uci set firewall.@zone[0].network='lan ipv6'

# uci commit dhcp
# uci commit network
# uci commit firewall

# EOF



echo "

# 额外组件
CONFIG_GRUB_IMAGES=y
CONFIG_VMDK_IMAGES=y

CONFIG_TARGET_ROOTFS_EXT4FS=y
CONFIG_TARGET_EXT4_RESERVED_PCT=0
CONFIG_TARGET_EXT4_BLOCKSIZE_4K=y
# CONFIG_TARGET_EXT4_BLOCKSIZE_2K is not set
# CONFIG_TARGET_EXT4_BLOCKSIZE_1K is not set
CONFIG_TARGET_EXT4_BLOCKSIZE=4096
# CONFIG_TARGET_EXT4_JOURNAL is not set


# 固件大小
CONFIG_TARGET_KERNEL_PARTSIZE=1024
CONFIG_TARGET_ROOTFS_PARTSIZE=1024

# CONFIG_TARGET_SQUASHFS_BLOCK_SIZE=512

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
CONFIG_PACKAGE_luci-app-ksmbd=n
CONFIG_PACKAGE_luci-app-accesscontrol=n
CONFIG_PACKAGE_luci-app-arpbind=n
CONFIG_PACKAGE_luci-app-ddns=n
CONFIG_PACKAGE_luci-app-samba4=n
CONFIG_PACKAGE_luci-app-upnp=n
CONFIG_PACKAGE_luci-app-vlmcsd=n
CONFIG_PACKAGE_luci-app-vsftpd=n
CONFIG_PACKAGE_luci-app-wol=n
CONFIG_PACKAGE_swconfig=n




" >> .config

# 移除 ddns 和 ddnsto
# sed -i 's/CONFIG_PACKAGE_ddns-scripts=y/CONFIG_PACKAGE_ddns-scripts=n/' .config
# sed -i 's/CONFIG_PACKAGE_ddns-scripts-cloudflare=y/CONFIG_PACKAGE_ddns-scripts-cloudflare=n/' .config
# sed -i 's/CONFIG_PACKAGE_ddns-scripts-dnspod=y/CONFIG_PACKAGE_ddns-scripts-dnspod=n/' .config
# sed -i 's/CONFIG_PACKAGE_ddns-scripts-services=y/CONFIG_PACKAGE_ddns-scripts-services=n/' .config
# sed -i 's/CONFIG_PACKAGE_ddns-scripts_aliyun=y/CONFIG_PACKAGE_ddns-scripts_aliyun=n/' .config
# sed -i 's/CONFIG_PACKAGE_luci-app-ddns=y/CONFIG_PACKAGE_luci-app-ddns=n/' .config
# sed -i 's/CONFIG_PACKAGE_luci-i18n-ddns-zh-cn=y/CONFIG_PACKAGE_luci-i18n-ddns-zh-cn=n/' .config

# sed -i 's/CONFIG_PACKAGE_ddnsto=y/CONFIG_PACKAGE_ddnsto=n/' .config
# sed -i 's/CONFIG_PACKAGE_luci-app-ddnsto=y/CONFIG_PACKAGE_luci-app-ddnsto=n/' .config
# sed -i 's/CONFIG_PACKAGE_luci-i18n-ddnsto-zh-cn=y/CONFIG_PACKAGE_luci-i18n-ddnsto-zh-cn=n/' .config

# 移除 bootstrap 主题
# sed -i 's/CONFIG_PACKAGE_luci-theme-bootstrap=y/CONFIG_PACKAGE_luci-theme-bootstrap=n/' .config

# 移除网卡驱动
# sed -i 's/CONFIG_PACKAGE_kmod-ath=y/CONFIG_PACKAGE_kmod-ath=n/' .config
# sed -i 's/CONFIG_PACKAGE_kmod-ath10k=y/CONFIG_PACKAGE_kmod-ath10k=n/' .config
# sed -i 's/CONFIG_PACKAGE_ath10k-board-qca9888=y/CONFIG_PACKAGE_ath10k-board-qca9888=n/' .config
# sed -i 's/CONFIG_PACKAGE_ath10k-board-qca988x=y/CONFIG_PACKAGE_ath10k-board-qca988x=n/' .config
# sed -i 's/CONFIG_PACKAGE_ath10k-board-qca9984=y/CONFIG_PACKAGE_ath10k-board-qca9984=n/' .config
# sed -i 's/CONFIG_PACKAGE_ath10k-firmware-qca9888=y/CONFIG_PACKAGE_ath10k-firmware-qca9888=n/' .config
# sed -i 's/CONFIG_PACKAGE_ath10k-firmware-qca988x=y/CONFIG_PACKAGE_ath10k-firmware-qca988x=n/' .config
# sed -i 's/CONFIG_PACKAGE_ath10k-firmware-qca9984=y/CONFIG_PACKAGE_ath10k-firmware-qca9984=n/' .config

# sed -i 's/CONFIG_PACKAGE_iw=y/CONFIG_PACKAGE_iw=n/' .config
# sed -i 's/CONFIG_PACKAGE_iwinfo=y/CONFIG_PACKAGE_iwinfo=n/' .config
# sed -i 's/CONFIG_PACKAGE_kmod-iwlwifi=y/CONFIG_PACKAGE_kmod-iwlwifi=n/' .config
# sed -i 's/CONFIG_PACKAGE_iwlwifi-firmware-ax101=y/CONFIG_PACKAGE_iwlwifi-firmware-ax101=n/' .config
# sed -i 's/CONFIG_PACKAGE_iwlwifi-firmware-ax200=y/CONFIG_PACKAGE_iwlwifi-firmware-ax200=n/' .config
# sed -i 's/CONFIG_PACKAGE_iwlwifi-firmware-ax201=y/CONFIG_PACKAGE_iwlwifi-firmware-ax201=n/' .config
# sed -i 's/CONFIG_PACKAGE_iwlwifi-firmware-ax210=y/CONFIG_PACKAGE_iwlwifi-firmware-ax210=n/' .config
# sed -i 's/CONFIG_PACKAGE_kmod-rtl8192c-common=y/CONFIG_PACKAGE_kmod-rtl8192c-common=n/' .config
# sed -i 's/CONFIG_PACKAGE_kmod-rtl8192cu=y/CONFIG_PACKAGE_kmod-rtl8192cu=n/' .config
# sed -i 's/CONFIG_PACKAGE_kmod-rtl8192de=y/CONFIG_PACKAGE_kmod-rtl8192de=n/' .config
# sed -i 's/CONFIG_PACKAGE_kmod-rtl8192se=y/CONFIG_PACKAGE_kmod-rtl8192se=n/' .config
# sed -i 's/CONFIG_PACKAGE_kmod-rtl8812au-ct=y/CONFIG_PACKAGE_kmod-rtl8812au-ct=n/' .config
# sed -i 's/CONFIG_PACKAGE_kmod-rtl8821ae=y/CONFIG_PACKAGE_kmod-rtl8821ae=n/' .config
# sed -i 's/CONFIG_PACKAGE_kmod-rtl8xxxu=y/CONFIG_PACKAGE_kmod-rtl8xxxu=n/' .config
# sed -i 's/CONFIG_PACKAGE_kmod-rtlwifi=y/CONFIG_PACKAGE_kmod-rtlwifi=n/' .config
# sed -i 's/CONFIG_PACKAGE_kmod-rtlwifi-btcoexist=y/CONFIG_PACKAGE_kmod-rtlwifi-btcoexist=n/' .config
# sed -i 's/CONFIG_PACKAGE_kmod-rtlwifi-pci=y/CONFIG_PACKAGE_kmod-rtlwifi-pci=n/' .config
# sed -i 's/CONFIG_PACKAGE_kmod-rtlwifi-usb=y/CONFIG_PACKAGE_kmod-rtlwifi-usb=n/' .config
# sed -i 's/CONFIG_PACKAGE_kmod-rtw88=y/CONFIG_PACKAGE_kmod-rtw88=n/' .config

# sed -i 's/CONFIG_PACKAGE_kmod-mt7915e=y/CONFIG_PACKAGE_kmod-mt7915e=n/' .config

# sed -i 's/CONFIG_PACKAGE_kmod-mt7921-common=y/CONFIG_PACKAGE_kmod-mt7921-common=n/' .config
# sed -i 's/CONFIG_PACKAGE_kmod-mt7921-firmware=y/CONFIG_PACKAGE_kmod-mt7921-firmware=n/' .config
# sed -i 's/CONFIG_PACKAGE_kmod-mt7921e=y/CONFIG_PACKAGE_kmod-mt7921e=n/' .config
# sed -i 's/CONFIG_PACKAGE_kmod-mt7921u=y/CONFIG_PACKAGE_kmod-mt7921u=n/' .config
