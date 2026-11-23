#!/usr/bin/env bash
set -euo pipefail

# check-duplicate-package.sh
# 重复包检测脚本，带白名单：豁免我们已经提前自动处理掉的预期冲突
# 执行时机：packages-LEDE-mosdns.sh 之后、make defconfig 之前
#
# 白名单说明：
# v2ray-geodata：我们脚本里已经 rm -rf package/pwpage/v2ray-geodata，属于预期冲突，直接跳过告警
WHITELIST=(
    "v2ray-geodata"
)

TOPDIR="${PWD}"
echo "====================================="
echo "🔍 开始扫描重复 Package 定义（带白名单豁免）"
echo "源码目录: ${TOPDIR}"
echo "白名单豁免包: ${WHITELIST[*]}"
echo "====================================="

TMP_LIST=$(mktemp)
TMP_DUP=$(mktemp)

# 遍历所有 Makefile，提取 Package:=
find "${TOPDIR}/package" "${TOPDIR}/feeds" -type f -name Makefile | while read -r mk; do
    grep -E '^[[:space:]]*Package:=' "${mk}" 2>/dev/null | sed -E 's/^[[:space:]]*Package:=//' | while read -r pkgname; do
        if [[ -n "${pkgname}" ]]; then
            echo "${pkgname}|${mk}" >> "${TMP_LIST}"
        fi
    done
done

# 拿到所有重复包名
cut -d'|' -f1 "${TMP_LIST}" | sort | uniq -d > "${TMP_DUP}"

if [[ ! -s "${TMP_DUP}" ]]; then
    echo "✅ 扫描完成：未检测到任何重复 Package"
    rm -f "${TMP_LIST}" "${TMP_DUP}"
    exit 0
fi

HAS_REAL_CONFLICT=0

echo "📋 检测到重复包清单："
echo "-------------------------------------"
while read -r dup_pkg; do
    # 判断是否在白名单
    IN_WHITELIST=0
    for w in "${WHITELIST[@]}"; do
        if [[ "${dup_pkg}" == "${w}" ]]; then
            IN_WHITELIST=1
            break
        fi
    done

    if [[ "${IN_WHITELIST}" -eq 1 ]]; then
        echo -e "\n🟡【白名单豁免】包名：${dup_pkg}"
        grep "^${dup_pkg}|" "${TMP_LIST}" | cut -d'|' -f2 | sort
        echo "👉 说明：该冲突已在 packages.sh 提前自动清理，无需处理"
    else
        HAS_REAL_CONFLICT=1
        echo -e "\n🔴【真实冲突】包名：${dup_pkg}"
        grep "^${dup_pkg}|" "${TMP_LIST}" | cut -d'|' -f2 | sort
    fi
done < "${TMP_DUP}"
echo "-------------------------------------"

rm -f "${TMP_LIST}" "${TMP_DUP}"

if [[ "${HAS_REAL_CONFLICT}" -eq 1 ]]; then
    echo "❌ 存在未处理的真实包冲突，终止构建！"
    exit 1
else
    echo "✅ 所有重复均为白名单内预期冲突，继续构建"
    exit 0
fi
