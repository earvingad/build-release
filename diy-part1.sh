#!/bin/bash
#
# Copyright (c) 2019-2020 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part1.sh
# Description: OpenWrt DIY script part 1 (Before Update feeds)
#

# Uncomment a feed source
#sed -i 's/^#\(.*helloworld\)/\1/' feeds.conf.default

# Add a feed source
#echo 'src-git helloworld https://github.com/fw876/helloworld' >>feeds.conf.default
#echo 'src-git passwall https://github.com/xiaorouji/openwrt-passwall' >>feeds.conf.default
# Modify default IP
# sed -i 's/192.168.1.1/10.1.1.1/g' package/base-files/files/bin/config_generate
# sed -i 's/='\''OpenWrt'\''/='\''krypton'\''/g' package/base-files/files/bin/config_generate

cat << "EOF" > package/base-files/files/etc/uci-defaults/99_custom
uci set wireless.@wifi-device[0].disabled='0'
uci set wireless.@wifi-device[1].disabled='0'
uci commit wireless

uci set network.lan.ipaddr='10.1.1.1'
uci commit network

uci set system.@system[0].hostname='krypton'
uci set system.@system[0].zonename='America/Mexico City'
uci set system.@system[0].timezone='CST6CDT,M4.1.0,M10.5.0'
uci commit system

uci set fstab.@global[0].anon_mount='1'
uci commit fstab
EOF
