#!/bin/bash
# =================================================================
# Copyright (c) 2019-2020 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part1.sh
# Description: OpenWrt DIY script part 1 (Before Update feeds)
# =================================================================

# Uncomment a feed source
sed -i 's/^#\(.*helloworld\)/\1/' feeds.conf.default

# Add a feed source
# echo 'src-git helloworld https://github.com/fw876/helloworld' >>feeds.conf.default

# echo 'src-git passwall https://github.com/xiaorouji/openwrt-passwall' >>feeds.conf.default

# echo 'src-git kenzo https://github.com/kenzok8/openwrt-packages;master' >>feeds.conf.default

# git clone https://github.com/kenzok8/openwrt-packages.git package/openwrt-packages

# git clone https://github.com/kenzok8/small.git package/small

# Import external feeds
# git clone https://github.com/Lienol/openwrt-package.git package/lienol

# git clone https://github.com/openwrt-develop/luci-theme-atmaterial package/luci-theme-atmaterial

# git clone https://github.com/rosywrt/luci-theme-rosy package/luci-theme-rosy

# luci-theme-argon
# cd openwrt/package/lean  
# rm -rf luci-theme-argon  
# git clone -b 18.06 https://github.com/jerrykuku/luci-theme-argon.git  

# git clone https://github.com/rufengsuixing/luci-app-adguardhome package/adguardhome

# git clone https://github.com/vernesong/OpenClash package/openclash

# git clone https://github.com/frainzy1477/luci-app-clash package/clash

# git clone https://github.com/fw876/helloworld package/ssrplus

# git clone https://github.com/tzxiaozhen88/luci-app-koolproxyR package/koolproxyR

# git clone https://github.com/kenzok78/luci-app-argone-config.git package/argone-config

# git clone 其他github插件源码地址 package/文件夹名称


# Add a feed source
# echo 'src-git helloworld https://github.com/fw876/helloworld' >>feeds.conf.default
# git clone https://github.com/fw876/helloworld package/helloworl


#echo 'src-git passwall https://github.com/xiaorouji/openwrt-passwall' >>feeds.conf.default


# echo 'src-git openclash https://github.com/vernesong/OpenClash' >>feeds.conf.default
# echo 'src-git adguardhome https://github.com/rufengsuixing/luci-app-adguardhome' >>feeds.conf.default
# echo 'src-git mosdns https://github.com/sbwml/luci-app-mosdns' >>feeds.conf.default


#  下载源码
## adguardhome
# git clone https://github.com/rufengsuixing/luci-app-adguardhome package/luci-app-adguardhome
# echo 'src-git adguardhome https://github.com/rufengsuixing/luci-app-adguardhome' >>feeds.conf.default

## autoreboot
# git clone https://github.com/f8q8/luci-app-autoreboot package/luci-app-autoreboot

## mosdns
# echo 'src-git mosdns https://github.com/sbwml/luci-app-mosdns' >>feeds.conf.default
# find ./ | grep Makefile | grep v2ray-geodata | xargs rm -f
# find ./ | grep Makefile | grep mosdns | xargs rm -f

# git clone https://github.com/sbwml/luci-app-mosdns -b v5 package/mosdns
# git clone https://github.com/sbwml/v2ray-geodata package/v2ray-geodata

## netspeedtest
# git clone https://github.com/sirpdboy/netspeedtest.git package/netspeedtest
# sed -i '$a src-git netspeedtest https://github.com/sirpdboy/netspeedtest' feeds.conf.default
# echo 'src-git netspeedtest https://github.com/sirpdboy/netspeedtest' >>feeds.conf.default

## OpenClash
# echo 'src-git openclash https://github.com/vernesong/OpenClash' >>feeds.conf.default


# echo 'src-git passwall_packages https://github.com/xiaorouji/openwrt-passwall-packages.git' >>feeds.conf.default

## passwall
# echo 'src-git passwall https://github.com/xiaorouji/openwrt-passwall' >>feeds.conf.default

## passwall2
# echo 'src-git passwall2 https://github.com/xiaorouji/openwrt-passwall2' >>feeds.conf.default


## poweroff
# echo 'src-git poweroff https://github.com/esirplayground/luci-app-poweroff' >>feeds.conf.default

# git clone https://github.com/esirplayground/luci-app-poweroff package/luci-app-poweroff

# sed -i '$a src-git kenzo https://github.com/kenzok8/openwrt-packages' feeds.conf.default
# sed -i '$a src-git small https://github.com/kenzok8/small' feeds.conf.default

## small-package-all
# sed -i '$a src-git smpackage https://github.com/kenzok8/small-package' feeds.conf.default
sed -i '$a src-git smpackage https://github.com/kenzok8/small-package' feeds.conf.default
# cd openwrt
# ./scripts/feeds update -a
# rm -rf feeds/smpackage/{base-files,dnsmasq,firewall*,fullconenat,libnftnl,nftables,ppp,opkg,ucl,upx,vsftpd*,miniupnpd-iptables,wireless-regdb}

## openwrt-packages-small
# sed -i '1i src-git kenzo https://github.com/kenzok8/openwrt-packages' feeds.conf.default
# sed -i '2i src-git small https://github.com/kenzok8/small' feeds.conf.default
# cd openwrt
# ./scripts/feeds update -a 
# rm -rf feeds/luci/applications/luci-app-mosdns
# rm -rf feeds/packages/net/{alist,adguardhome,mosdns,xray*,v2ray*,v2ray*,sing*,smartdns}
# rm -rf feeds/packages/utils/v2dat
# rm -rf feeds/packages/lang/golang
# git clone https://github.com/kenzok8/golang feeds/packages/lang/golang



# sed -i '$a src-git kenzo https://github.com/kenzok8/openwrt-packages' feeds.conf.default
# sed -i '$a src-git small https://github.com/kenzok8/small' feeds.conf.default


# # iStore
# echo 'src-git istore https://github.com/linkease/istore;main' >> feeds.conf.default


# cd openwrt
# ./scripts/feeds update -a
# rm -rf feeds/luci/applications/luci-app-passwall



# #!/bin/bash

# #删除feeds中的插件
# # rm -rf ./feeds/packages/net/mosdns
# # rm -rf ./feeds/packages/net/v2ray-geodata
# rm -rf ./feeds/packages/net/geoview
# rm -rf ./feeds/packages/net/shadowsocks-libev
# rm -rf ./feeds/packages/net/chinadns-ng
# rm -rf ./feeds/luci/applications/luci-app-passwall
# #克隆依赖插件
# git clone https://github.com/xiaorouji/openwrt-passwall-packages.git package/pwpage


# #克隆的源码放在small文件夹
# mkdir package/small
# pushd package/small


# #adguardhome
# git clone -b 2023.10 --depth 1 https://github.com/XiaoBinin/luci-app-adguardhome.git package/luci-app-adguardhome
# git clone https://github.com/rufengsuixing/luci-app-adguardhome package/luci-app-adguardhome
# git clone --depth 1 https://github.com/kenzok78/luci-app-adguardhome package/luci-app-adguardhome


# #lucky
# # git clone -b main --depth 1 https://github.com/sirpdboy/luci-app-lucky.git

# # #smartdns
# # git clone -b lede --depth 1 https://github.com/pymumu/luci-app-smartdns.git
# # git clone -b master --depth 1 https://github.com/pymumu/smartdns.git

# # #ssrp
# git clone -b master --depth 1 https://github.com/fw876/helloworld.git package/helloworld

# # #passwall
# git clone -b main --depth 1 https://github.com/xiaorouji/openwrt-passwall.git

# #passwall2
# git clone -b main --depth 1 https://github.com/xiaorouji/openwrt-passwall2.git

# # #mosdns
# find ./ | grep Makefile | grep v2ray-geodata | xargs rm -f
# find ./ | grep Makefile | grep mosdns | xargs rm -f

# git clone https://github.com/sbwml/luci-app-mosdns -b v5 package/mosdns
# git clone https://github.com/sbwml/v2ray-geodata package/v2ray-geodata
# # #openclash
# git clone -b master --depth 1 https://github.com/vernesong/OpenClash.git

# ## poweroff
# git clone -b master https://github.com/esirplayground/luci-app-poweroff.git package/luci-app-poweroff

# ## iStore
# git clone -b main https://github.com/linkease/istore.git package/istore

# ## netspeedtest
# git clone -b master https://github.com/sirpdboy/netspeedtest.git package/netspeedtes
# echo 'src-git netspeedtest https://github.com/sirpdboy/netspeedtest' >>feeds.conf.default

# ## luci-app-UUGameAcc 
# git  clone -b master https://github.com/BCYDTZ/luci-app-UUGameAcc feeds/luci-app-UUGameAcc


# cd openwrt
# ./scripts/feeds update -a
# rm -rf feeds/luci/applications/luci-app-passwall


# popd

# echo "packages executed successfully!"

# add feed
# echo "src-git nikki https://github.com/nikkinikki-org/OpenWrt-nikki.git;main" >> "feeds.conf.default"
