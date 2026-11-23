#!/usr/bin/env bash
set -euo pipefail

WHITELIST=(
    "v2ray-geodata"
)

TOPDIR="${PWD}"
echo "====================================="
echo "🔍 开始扫描重复 Package 定义（静态写入文件版，规避SIGPIPE）"
echo "源码目录: ${TOPDIR}"
echo "白名单豁免包: ${WHITELIST[*]}"
echo "====================================="

TMP_LIST=$(mktemp)
TMP_DUP=$(mktemp)
trap 'rm -f "${TMP_LIST}" "${TMP_DUP}"' EXIT

# 先全部抓取写入临时文件，彻底避开管道SIGPIPE
find "${TOPDIR}/package" "${TOPDIR}/feeds" -type f -name Makefile > "${TMP_DUP}.files"
while read -r mk; do
    grep -E '^[[:space:]]*Package:=' "${mk}" 2>/dev/null || true | sed -E 's/^[[:space:]]*Package:=//' | while read -r pkgname; do
        [[ -n "${pkgname}" ]] && echo "${pkgname}|${mk}" >> "${TMP_LIST}"
    done
done < "${TMP_DUP}.files"
rm -f "${TMP_DUP}.files"

cut -d'|' -f1 "${TMP_LIST}" | sort | uniq -d > "${TMP_DUP}"

if [[ ! -s "${TMP_DUP}" ]]; then
    echo "✅ 扫描完成：未检测到任何重复 Package"
    exit 0
fi

HAS_REAL_CONFLICT=0
echo "📋 检测到重复包清单："
echo "-------------------------------------"
while read -r dup_pkg; do
    IN_WHITELIST=0
    for w in "${WHITELIST[@]}"; do
        [[ "${dup_pkg}" == "${w}" ]] && { IN_WHITELIST=1; break; }
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

if [[ "${HAS_REAL_CONFLICT}" -eq 1 ]]; then
    echo "❌ 存在未处理的真实包冲突，终止构建！"
    exit 1
else
    echo "✅ 所有重复均为白名单内预期冲突，继续构建"
    exit 0
fi
