# Modify default IP
sed -i 's/192.168.1.1/192.168.2.1/g' package/base-files/files/bin/config_generate

# Modify hostname
sed -i 's/OpenWrt/Newifi-D2/g' package/base-files/files/bin/config_generate

# Modify default theme
sed -i 's/luci-theme-bootstrap/luci-theme-argon/g' feeds/luci/collections/luci/Makefile

#64M FLASH
sed -i '/spi-max-frequency/a\t\tbroken-flash-reset;' target/linux/ramips/dts/mt7621_d-team_newifi-d2.dts
sed -i 's/reg = <0x50000 0x1fb0000>/reg = <0x50000 0x3fb0000>/g' target/linux/ramips/dts/mt7621_d-team_newifi-d2.dts
sed -i 's/32448k/64521k/g' target/linux/ramips/image/mt7621.mk
