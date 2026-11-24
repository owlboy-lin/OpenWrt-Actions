#!/usr/bin/env bash
#
# packages-LEDE-mosdns.sh
# 执行时机：feeds update && feeds install 之后，check-duplicate-package.sh 之前
# 工作目录：openwrt 源码根目录
# 策略：
# 1. mosdns v5 自带 v2ray-geodata 作为全局唯一 geodata 来源，删除 pwpage 内部同包避免 duplicate
# 2. luci-app-passwall + luci-app-passwall2 双面板共存编译，共用一套 pwpage 依赖
# 3. ⚠️ 使用限制：运行时【同一时间只能开启其中一个代理的透明代理】，不要同时启动两套代理服务
# 4. netspeedtest 已经替换 muink 无python版本，修复 python3-pkg-resources 报错
#
set -euo pipefail

clone() {
    local target_dir="$1"
    local repo_url="$2"
    shift 2
    local dest="package/${target_dir}"
    echo "====================================="
    echo "==> Clone: ${repo_url} -> ${dest}"
    if [ -d "${dest}" ]; then
        echo "⚠️ 目录 ${dest} 已存在，先删除旧目录"
        rm -rf "${dest}" || true
    fi
    git clone --depth 1 "$@" "${repo_url}" "${dest}"
}

echo "==> 删除 feeds 中被覆盖的插件"
rm -rf feeds/packages/net/{mosdns,lucky} || true
rm -rf feeds/packages/net/{xray-core,v2ray-geodata,sing-box,chinadns-ng,dns2socks,hysteria,ipt2socks,microsocks,naiveproxy,shadowsocks-rust,shadowsocksr-libev,simple-obfs,tcping,v2ray-plugin,xray-plugin,geoview,shadow-tls,smartdns} || true
rm -rf feeds/luci/applications/{luci-app-lucky,luci-app-smartdns,luci-app-mosdns,luci-app-adguardhome} || true

echo "==> 克隆依赖插件（共用一套 pwpage，给 passwall / passwall2 一起用）"
clone pwpage https://github.com/Openwrt-Passwall/openwrt-passwall-packages.git -b main

# 主题
clone luci-theme-aurora https://github.com/eamonxg/luci-theme-aurora.git -b master

# 定时控制
# clone https://github.com/gaobin89/luci-app-timecontrol.git luci-app-timecontrol -b js

# homeproxy（immortalwrt 版本，规则文件由 scripts/homeproxy.sh 在后面补）
clone https://github.com/immortalwrt/homeproxy.git homeproxy -b master

# lucky
# clone luci-app-lucky https://github.com/gdy666/luci-app-lucky.git -b main

# smartdns
# clone luci-app-smartdns https://github.com/pymumu/luci-app-smartdns.git -b master

# passwall + passwall2 双LuCI面板，共存编译（共用上面pwpage依赖）
# ⚠️ 运行时只能启用一个代理，禁止同时开启两套透明代理
clone luci-app-passwall https://github.com/Openwrt-Passwall/openwrt-passwall.git -b main
clone luci-app-passwall2 https://github.com/Openwrt-Passwall/openwrt-passwall2.git -b main

# ssrp
#clone https://github.com/fw876/helloworld.git luci-app-ssr-plus -b dev

# mosdns v5（自带 v2ray-geodata，全局唯一 geodata）
clone luci-app-mosdns https://github.com/sbwml/luci-app-mosdns.git -b v5

# adguardhome
clone luci-app-adguardhome https://github.com/kenzok78/luci-app-adguardhome.git -b main

# 网络测速：muink版本，无python依赖
# clone luci-app-netspeedtest https://github.com/muink/luci-app-netspeedtest.git -b master
# clone librespeed-go https://github.com/muink/openwrt-librespeed-go.git -b master

# OpenClash
# clone OpenClash https://github.com/vernesong/OpenClash.git -b master

# 透明代理
# clone luci-app-nikki https://github.com/nikkinikki-org/OpenWrt-nikki.git -b main
# clone luci-app-momo https://github.com/nikkinikki-org/OpenWrt-momo.git -b main
# clone luci-app-daed https://github.com/QiuSimons/luci-app-daed.git -b kix

# bandix流量监控
clone luci-app-bandix https://github.com/timsaya/luci-app-bandix.git -b main
clone openwrt-bandix https://github.com/timsaya/openwrt-bandix.git -b main

# 温度状态
clone luci-app-temp-status https://github.com/gSpotx2f/luci-app-temp-status.git -b master

# openlist2
clone luci-app-openlist2 https://github.com/sbwml/luci-app-openlist2.git -b main

# wol唤醒增强
clone luci-app-wolplus https://github.com/animegasan/luci-app-wolplus.git -b main

# ====================== 核心冲突处理（方案1）======================
# 删除 pwpage 里面自带的 v2ray-geodata，全局使用 mosdns v5 自带的那一份
echo -e "\n==> 🧹 处理 v2ray-geodata 冲突：删除 pwpage 内置版本，复用 mosdns v5 自带"
rm -rf package/pwpage/v2ray-geodata || true
echo "✅ package/pwpage/v2ray-geodata 已移除"

# 🩹 关键补丁：增加 PROVIDES，兼容旧依赖 v2ray-geoip / v2ray-geosite
echo -e "\n==> 🩹 给 sbwml v2ray-geodata 增加 PROVIDES 兼容 v2ray-geoip / v2ray-geosite"
GEO_MK="package/luci-app-mosdns/v2ray-geodata/Makefile"
if [ -f "${GEO_MK}" ]; then
    grep -q 'PROVIDES:=v2ray-geoip v2ray-geosite' "${GEO_MK}" || sed -i '/^define Package\/v2ray-geodata/a\
PROVIDES:=v2ray-geoip v2ray-geosite' "${GEO_MK}"
    echo "✅ PROVIDES 补丁写入完成"
else
    echo "⚠️ ${GEO_MK} 不存在，跳过补丁"
fi
# =================================================================

echo -e "\n==> 清理悬空软链（feeds目录残留无效链接）"
if [ -d package/feeds ]; then
    find package/feeds -xtype l -delete
fi
echo "悬空软链清理完成，剩余无效链接数量: $(find package/feeds -xtype l 2>/dev/null | wc -l)"
echo -e "\n✅ packages-LEDE-mosdns.sh 执行完成"
echo -e "⚠️ 重要提醒：固件内置 passwall + passwall2，使用时同一时间只能开启其中一个代理透明代理！"
