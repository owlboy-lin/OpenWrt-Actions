#!/bin/bash

# 处理feeds中的rust版本
rm -rf feeds/packages/lang/rust
cp -r /workdir/patchs/rust feeds/packages/lang
# chmod -R 755 feeds/packages/lang/rust

#删除feeds中的插件
rm -rf feeds/packages/lang/golang
rm -rf feeds/luci/applications/{luci-app-mosdns,luci-app-passwall}

# 移除 openwrt feeds 自带的核心库
rm -rf feeds/packages/net/{xray-core,v2ray-geodata,sing-box,chinadns-ng,dns2socks,hysteria,ipt2socks,microsocks,naiveproxy,shadowsocks-libev,shadowsocks-rust,shadowsocksr-libev,simple-obfs,tcping,trojan-plus,tuic-client,v2ray-plugin,xray-plugin,geoview,shadow-tls}
git clone --depth 1 https://github.com/Openwrt-Passwall/openwrt-passwall-packages package/passwall-packages

# 移除 openwrt feeds 过时的luci版本
rm -rf feeds/luci/applications/luci-app-passwall
git clone -b main --depth 1 https://github.com/Openwrt-Passwall/openwrt-passwall.git package/passwall-luci

#克隆依赖插件
# git clone --depth 1 https://github.com/Openwrt-Passwall/openwrt-passwall-packages package/passwall-packages
git clone --depth 1 https://github.com/sbwml/packages_lang_golang -b 25.x feeds/packages/lang/golang


#克隆的源码放在small文件夹
mkdir package/small
pushd package/small

# luci-theme-aurora
git clone -b master --depth 1 https://github.com/eamonxg/luci-theme-aurora.git

# luci-app-nft-timecontrol
git clone -b main --depth 1 https://github.com/sirpdboy/luci-app-timecontrol.git

# adguardhome
git clone -b 2024.09.05 --depth 1 https://github.com/XiaoBinin/luci-app-adguardhome.git

# lucky
git clone -b main --depth 1 https://github.com/gdy666/luci-app-lucky.git

# smartdns
# git clone -b master --depth 1 https://github.com/pymumu/luci-app-smartdns.git
# git clone -b master --depth 1 https://github.com/pymumu/smartdns.git

# ssrp
git clone -b master --depth 1 https://github.com/fw876/helloworld.git

# VIKINGYFY/packages
git clone -b main --depth 1 https://github.com/VIKINGYFY/packages.git

# passwall
# git clone -b main --depth 1 https://github.com/Openwrt-Passwall/openwrt-passwall.git package/passwall-luci

# passwall2
# git clone -b main --depth 1 https://github.com/Openwrt-Passwall/openwrt-passwall2.git

# mosdns
git clone -b v5 --depth 1 https://github.com/sbwml/luci-app-mosdns.git

# luci-app-netspeedtest
git clone -b master --depth 1 https://github.com/sirpdboy/luci-app-netspeedtest.git

# openclash
# git clone -b master --depth 1 https://github.com/vernesong/OpenClash.git

# OpenWrt-nikki
git clone -b main --depth 1 https://github.com/nikkinikki-org/OpenWrt-nikki.git

# OpenWrt-momo
git clone -b main --depth 1 https://github.com/nikkinikki-org/OpenWrt-momo.git

# daed
git clone -b master --depth 1 https://github.com/QiuSimons/luci-app-daed.git

#添加TurboAcc
# curl -sSL https://raw.githubusercontent.com/chenmozhijin/turboacc/luci/add_turboacc.sh -o add_turboacc.sh && bash add_turboacc.sh

# iStore
git clone --depth=1 -b main https://github.com/linkease/istore.git package/istore

# kz8-small
git clone --depth=1 https://github.com/kenzok8/small-package.git package/kz8-small
# mv package/kz8-small/adguardhome package/adguardhome
# mv package/kz8-small/luci-app-adguardhome package/luci-app-adguardhome
# mv package/kz8-small/luci-app-ikoolproxy package/luci-app-ikoolproxy
# mv package/kz8-small/luci-app-partexp package/luci-app-partexp
# mv package/kz8-small/luci-app-wrtbwmon package/luci-app-wrtbwmon
# mv package/kz8-small/wrtbwmon package/wrtbwmon
# mv package/kz8-small/luci-app-netspeedtest package/luci-app-netspeedtest
# mv package/kz8-small/netspeedtest package/netspeedtest
# mv package/kz8-small/homebox package/homebox
# mv package/kz8-small/speedtest-cli package/speedtest-cli
mv package/kz8-small/luci-app-poweroff package/luci-app-poweroff
mv package/kz8-small/luci-app-quickstart package/luci-app-quickstart
mv package/kz8-small/quickstart package/quickstart
mv package/kz8-small/luci-app-store package/luci-app-store
mv package/kz8-small/luci-lib-taskd package/luci-lib-taskd
mv package/kz8-small/luci-lib-xterm package/luci-lib-xterm
mv package/kz8-small/taskd package/taskd
# mv package/kz8-small/luci-app-nikki package/luci-app-nikki
# mv package/kz8-small/nikki package/nikki
rm -rf package/kz8-small

popd

echo "packages executed successfully!"

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


# 主题调整
CONFIG_PACKAGE_luci-theme-argon=y
CONFIG_PACKAGE_luci-app-argon-config=y
CONFIG_PACKAGE_luci-theme-aurora=y
CONFIG_PACKAGE_luci-app-autoreboot=y

# 自动重启
CONFIG_PACKAGE_luci-app-autoreboot=y


# luci-app-filemanager
CONFIG_PACKAGE_luci-app-filemanager=y


# 关机
CONFIG_PACKAGE_luci-app-poweroff=y


# 科学插件调整
CONFIG_PACKAGE_luci-app-homeproxy=y
CONFIG_PACKAGE_luci-app-openclash=n
CONFIG_PACKAGE_luci-app-passwall=y
CONFIG_PACKAGE_luci-app-passwall2=y
CONFIG_PACKAGE_luci-app-nikki=y
CONFIG_PACKAGE_luci-app-momo=y
CONFIG_PACKAGE_luci-app-daed=y
CONFIG_PACKAGE_luci-app-ssr-plus=y


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


# quickstart
CONFIG_PACKAGE_luci-app-quickstart=n


# store
CONFIG_PACKAGE_luci-app-store=y


# luci-app-ttyd=y
CONFIG_PACKAGE_luci-app-ttyd=y


# luci-app-turboacc
CONFIG_PACKAGE_luci-app-turboacc=y


# luci-app-uugamebooster
CONFIG_PACKAGE_luci-app-uugamebooster=n

CONFIG_PACKAGE_luci-app-upnp=y

# luci-app-vssr
CONFIG_PACKAGE_luci-app-vssr=y

# luci-app-timecontrol
CONFIG_PACKAGE_luci-app-timecontrol=y

# luci-app-turboacc
CONFIG_PACKAGE_luci-app-turboacc=y

# luci-app-webadmin=y
CONFIG_PACKAGE_luci-app-webadmin=y

CONFIG_PACKAGE_luci-app-lucky=y







" >> .config