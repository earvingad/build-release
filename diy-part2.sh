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

# Modify default IP
sed -i 's/192.168.15.1/10.1.1.1/g' package/base-files/files/bin/config_generate
sed -i 's/="${DISTRIB_ID}"/='\''krypton'\''/g' feeds/x/base-config-setting/files/uci.defaults
sed -i 's/Asia\/Shanghai/America\/Mexico\ City/g' feeds/x/base-config-setting/files/uci.defaults
sed -i 's/CST-8/CST6CDT,M4.1.0,M10.5.0/g' feeds/x/base-config-setting/files/uci.defaults
sed -i 's/PasswordAuth='\''off'\''/PasswordAuth='\''on'\''/g' feeds/x/base-config-setting/files/uci.defaults
sed -i 's/${SSID}/'\''OpenWrt'\''/g' feeds/x/base-config-setting/files/uci.defaults

wget -O /package/base-files/files/etc/banner https://raw.githubusercontent.com/openwrt/openwrt/master/package/base-files/files/etc/banner
