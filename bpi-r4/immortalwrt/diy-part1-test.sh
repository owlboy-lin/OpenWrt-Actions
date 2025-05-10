#!/bin/bash

# Merge_package
function merge_package(){
    repo=`echo $1 | rev | cut -d'/' -f 1 | rev`
    pkg=`echo $2 | rev | cut -d'/' -f 1 | rev`
    # find package/ -follow -name $pkg -not -path "package/openwrt-packages/*" | xargs -rt rm -rf
    git clone --depth=1 --single-branch $1
    [ -d package/openwrt-packages ] || mkdir -p package/openwrt-packages
    mv $2 package/openwrt-packages/
    rm -rf $repo
}

rm -rf feeds/luci/themes/luci-theme-argon
rm -rf feeds/luci/applications/luci-app-argon-config

# Clone community packages to package/community
mkdir package/community
pushd package/community
git clone --depth=1 https://github.com/fw876/helloworld
git clone --depth=1 https://github.com/vernesong/OpenClash
git clone --depth=1 https://github.com/xiaorouji/openwrt-passwall
git clone --depth=1 https://github.com/xiaorouji/openwrt-passwall-packages
git clone --depth=1 https://github.com/nikkinikki-org/OpenWrt-nikki
git clone --depth=1 https://github.com/DHDAXCW/dhdaxcw-app
git clone --depth=1 https://github.com/jerrykuku/luci-theme-argon
git clone --depth=1 https://github.com/jerrykuku/luci-app-argon-config
git clone --depth=1 https://github.com/sirpdboy/netspeedtest
git clone --depth=1 https://github.com/sirpdboy/luci-app-poweroffdevice
git clone --depth=1 https://github.com/sirpdboy/luci-app-partexp 
git clone --depth=1 https://github.com/linkease/istore
merge_package https://github.com/DHDAXCW/lede-rockchip lede-rockchip/package/wwan
merge_package https://github.com/kenzok8/jell jell/luci-app-fan
merge_package https://github.com/kenzok8/jell jell/luci-app-serverchan
merge_package https://github.com/kenzok8/jell jell/luci-app-webadmin
merge_package "-b Immortalwrt https://github.com/shidahuilang/openwrt-package" openwrt-package/relevance/ddnsto
merge_package "-b Immortalwrt https://github.com/shidahuilang/openwrt-package" openwrt-package/luci-app-ddnsto
# merge_package "-b Immortalwrt https://github.com/shidahuilang/openwrt-package" openwrt-package/luci-app-quickstart
# merge_package https://github.com/kenzok8/jell jell/quickstart
# merge_package https://github.com/kenzok8/jell jell/luci-app-quickstart
# merge_package https://github.com/kenzok8/jell jell/luci-lib-js
popd

rm  -rf package/community/dhdaxcw-app/adguardhome
rm  -rf package/community/dhdaxcw-app/luci-app-adguardhome

pushd package/community
merge_package https://github.com/kenzok8/small-package small-package/adguardhome
merge_package https://github.com/kenzok8/small-package small-package/luci-app-adguardhome
popd


# Lucky
rm -rf package/lucky
git clone  https://github.com/gdy666/luci-app-lucky.git package/lucky
#echo 'src-git moruiris https://github.com/moruiris/openwrt-packages;immortalwrt' >>feeds.conf.default
# 添加nikki(mihomo) feed
# echo "src-git nikki https://github.com/nikkinikki-org/OpenWrt-nikki.git;main" >> "feeds.conf.default"

# add luci-app-mosdns
rm -rf feeds/packages/lang/golang
git clone https://github.com/sbwml/packages_lang_golang -b 23.x feeds/packages/lang/golang
rm -rf feeds/packages/net/v2ray-geodata
rm -rf feeds/packages/net/mosdns
git clone https://github.com/sbwml/luci-app-mosdns -b v5 package/mosdns
git clone https://github.com/sbwml/v2ray-geodata package/v2ray-geodata
