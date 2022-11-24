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

#修改默认IP
sed -i 's/192.168.1.1/192.168.2.1/g' package/base-files/files/bin/config_generate

# Modify hostname
sed -i 's/OpenWrt/Newifi-D2/g' package/base-files/files/bin/config_generate

# Modify default theme
sed -i 's/luci-theme-bootstrap/luci-theme-argon/g' feeds/luci/collections/luci/Makefile

#64M FLASH
#sed -i '/spi-max-frequency/a\t\tbroken-flash-reset;' target/linux/ramips/dts/mt7621_d-team_newifi-d2.dts
sed -i 's/reg = <0x50000 0x1fb0000>/reg = <0x50000 0x3fb0000>/g' target/linux/ramips/dts/mt7621_d-team_newifi-d2.dts
sed -i 's/32448k/64521k/g' target/linux/ramips/image/mt7621.mk

#设置首次登录后台密码为空（进入openwrt后自行修改密码）
#sed -i '/CYXluq4wUazHjmCDBCqXF/d' package/lean/default-settings/files/zzz-default-settings

#删除默认防火墙
sed -i '/to-ports 53/d' package/lean/default-settings/files/zzz-default-settings
