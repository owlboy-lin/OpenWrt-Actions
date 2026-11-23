#!/usr/bin/env bash
#
# 处理 feeds 里的插件，并克隆需要覆盖/新增的第三方插件
# 必须在 openwrt 源码根目录执行（build.yml 已保证）
#
set -euo pipefail

clone() {
  local url="$1" dir="$2"
  shift 2
  echo "==> clone ${url} -> ${dir}"
  git clone --depth 1 "$@" "$url" "$dir"
}

echo "==> 删除 feeds 中被覆盖的插件"
rm -rf feeds/packages/net/{mosdns,lucky}
rm -rf feeds/packages/net/{xray-core,v2ray-geodata,sing-box,chinadns-ng,dns2socks,hysteria,ipt2socks,microsocks,naiveproxy,shadowsocks-rust,shadowsocksr-libev,simple-obfs,tcping,v2ray-plugin,xray-plugin,geoview,shadow-tls,smartdns}
# rm -rf feeds/luci/applications/{luci-app-passwall,luci-app-passwall2,luci-app-homeproxy,luci-app-timecontrol}
rm -rf feeds/luci/applications/{luci-app-lucky,luci-app-smartdns,luci-app-mosdns,luci-app-adguardhome}
# rm -rf feeds/luci/applications/{luci-app-nikki,luci-app-momo,luci-app-daed}

echo "==> 克隆依赖插件"
# passwall 的依赖包（xray-core / sing-box / hysteria / geoview ...）
clone https://github.com/Openwrt-Passwall/openwrt-passwall-packages.git package/pwpage

mkdir -p package/small
pushd package/small > /dev/null

# 主题
clone https://github.com/eamonxg/luci-theme-aurora.git luci-theme-aurora -b master
# 定时控制
# clone https://github.com/gaobin89/luci-app-timecontrol.git luci-app-timecontrol -b js
# homeproxy（immortalwrt 版本，规则文件由 scripts/homeproxy.sh 在后面补）
# clone https://github.com/immortalwrt/homeproxy.git homeproxy -b master
# lucky
clone https://github.com/gdy666/luci-app-lucky.git luci-app-lucky -b main
# smartdns
clone https://github.com/pymumu/luci-app-smartdns.git luci-app-smartdns -b master
# VIKINGYFY/packages（一堆 luci 依赖）
# clone https://github.com/VIKINGYFY/packages.git VIKINGYFY-packages -b main
# passwall / passwall2
clone https://github.com/Openwrt-Passwall/openwrt-passwall.git luci-app-passwall -b main
clone https://github.com/Openwrt-Passwall/openwrt-passwall2.git luci-app-passwall2 -b main
# mosdns
clone https://github.com/sbwml/luci-app-mosdns.git luci-app-mosdns -b v5
# adguardhome
# git clone -b 2024.09.05 --depth 1 https://github.com/XiaoBinin/luci-app-adguardhome.git
clone https://github.com/kenzok78/luci-app-adguardhome.git luci-app-adguardhome -b main
# git clone -b master --depth 1 https://github.com/rufengsuixing/luci-app-adguardhome.git
# smartdns
# git clone -b master --depth 1 https://github.com/pymumu/luci-app-smartdns.git
# git clone -b master --depth 1 https://github.com/pymumu/smartdns.git
# sed -i 's@include ../../lang/rust/rust-package.mk@include $(TOPDIR)/feeds/packages/lang/rust/rust-package.mk@g' smartdns/package/openwrt/Makefile
# sed -n '33p' smartdns/package/openwrt/Makefile
# 网络测速
# clone https://github.com/muink/luci-app-netspeedtest.git luci-app-netspeedtest -b master
clone https://github.com/sirpdboy/netspeedtest.git luci-app-netspeedtest -b main
# openclash
clone https://github.com/vernesong/OpenClash.git OpenClash -b master
# 透明代理系
clone https://github.com/nikkinikki-org/OpenWrt-nikki.git luci-app-nikki -b main
clone https://github.com/nikkinikki-org/OpenWrt-momo.git luci-app-momo -b main
clone https://github.com/QiuSimons/luci-app-daed.git luci-app-daed -b master
# 流量监控（luci 前端 + bandix 核心包；核心是预编译二进制，按架构从 release 下载）
clone https://github.com/timsaya/luci-app-bandix.git luci-app-bandix -b main
clone https://github.com/timsaya/openwrt-bandix.git openwrt-bandix -b main
# 温度显示（状态页）
clone https://github.com/gSpotx2f/luci-app-temp-status.git luci-app-temp-status -b master
# 网盘（alist 的继任者，取代已失效的 aliyundrive-webdav）
clone https://github.com/sbwml/luci-app-openlist2.git luci-app-openlist2 -b main
#luci-app-wolplus
clone https://github.com/animegasan/luci-app-wolplus.git luci-app-wolplus -b main

popd > /dev/null

echo "==> 清理悬空软链（feeds 目录已删除、又没有补回来的那些包）"
if [ -d package/feeds ]; then
  find package/feeds -xtype l -delete
fi
echo "悬空软链数量: $(find package/feeds -xtype l 2>/dev/null | wc -l)"

echo "✅ packages.sh 完成"#!/usr/bin/env bash
#
# 处理 feeds 里的插件，并克隆需要覆盖/新增的第三方插件
# 执行时机：feeds update && feeds install 之后
# 工作目录：openwrt 源码根目录
#
set -euo pipefail

clone() {
    local target_dir="$1"
    local repo_url="$2"
    shift 2
    echo "====================================="
    echo "==> Clone: ${repo_url} -> package/${target_dir}"
    git clone --depth 1 "$@" "${repo_url}" "package/${target_dir}"
}

# 容错删除：删除 feeds 内冲突包
echo "==> 删除 feeds 中被覆盖的插件"
rm -rf feeds/packages/net/{mosdns,lucky} || true
rm -rf feeds/packages/net/{xray-core,v2ray-geodata,sing-box,chinadns-ng,dns2socks,hysteria,ipt2socks,microsocks,naiveproxy,shadowsocks-rust,shadowsocksr-libev,simple-obfs,tcping,v2ray-plugin,xray-plugin,geoview,shadow-tls,smartdns} || true
rm -rf feeds/luci/applications/{luci-app-lucky,luci-app-smartdns,luci-app-mosdns,luci-app-adguardhome} || true

echo "==> 克隆依赖插件"
# passwall 依赖包
clone pwpage https://github.com/Openwrt-Passwall/openwrt-passwall-packages.git -b main

# 主题
clone luci-theme-aurora https://github.com/eamonxg/luci-theme-aurora.git -b master

# homeproxy（immortalwrt 版本，规则文件由 scripts/homeproxy.sh 在后面补）
# clone https://github.com/immortalwrt/homeproxy.git homeproxy -b master

# lucky
clone luci-app-lucky https://github.com/gdy666/luci-app-lucky.git -b main
# smartdns
clone luci-app-smartdns https://github.com/pymumu/luci-app-smartdns.git -b master

# passwall / passwall2 【⚠️ 两者同时开启极易依赖冲突，建议只保留一个】
clone luci-app-passwall https://github.com/Openwrt-Passwall/openwrt-passwall.git -b main
clone luci-app-passwall2 https://github.com/Openwrt-Passwall/openwrt-passwall2.git -b main

# mosdns v5 【⚠️ 和passwall的v2ray-geodata存在包冲突，二选一处理】
clone luci-app-mosdns https://github.com/sbwml/luci-app-mosdns.git -b v5

# adguardhome
clone luci-app-adguardhome https://github.com/kenzok78/luci-app-adguardhome.git -b main

# 网络测速
clone luci-app-netspeedtest https://github.com/sirpdboy/netspeedtest.git -b main

# OpenClash 【⚠️ 源码方式拉取，内核下载容易超时；你yml已有CLASH_CORE_SH，建议替换为仅拉luci面板版本】
# clone OpenClash https://github.com/vernesong/OpenClash.git -b master

# 透明代理
clone luci-app-nikki https://github.com/nikkinikki-org/OpenWrt-nikki.git -b main
clone luci-app-momo https://github.com/nikkinikki-org/OpenWrt-momo.git -b main
clone luci-app-daed https://github.com/QiuSimons/luci-app-daed.git -b main

# bandix流量监控
clone luci-app-bandix https://github.com/timsaya/luci-app-bandix.git -b main
clone openwrt-bandix https://github.com/timsaya/openwrt-bandix.git -b main

# 温度状态
clone luci-app-temp-status https://github.com/gSpotx2f/luci-app-temp-status.git -b master

# openlist2
clone luci-app-openlist2 https://github.com/sbwml/luci-app-openlist2.git -b main

# wol唤醒增强
clone luci-app-wolplus https://github.com/animegasan/luci-app-wolplus.git -b main

echo "==> 清理悬空软链（feeds目录残留无效链接）"
if [ -d package/feeds ]; then
    find package/feeds -xtype l -delete
fi
echo "悬空软链清理完成，剩余无效链接数量: $(find package/feeds -xtype l 2>/dev/null | wc -l)"

echo "✅ packages-LEDE-mosdns.sh 执行完成"
