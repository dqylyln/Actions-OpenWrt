#!/bin/bash
#=================================================
# Description: DIY script
# Lisence: MIT
# Author: P3TERX
# Blog: https://p3terx.com
#=================================================
#### Modify default IP
sed -i 's/192.168.1.1/192.168.1.2/g' package/base-files/files/bin/config_generate

#### add ext luci-app
git clone https://github.com/kenzok8/openwrt-packages package/openwrt-packages

#### ext passwall depend
git clone https://github.com/kenzok8/small package/small

#### remove ext for customize import conflict plugins
rm -rf package/openwrt-packages/luci-app-ssr-plus
rm -rf package/openwrt-packages/luci-app-jd-dailybonus
## for vssr 
rm -rf package/openwrt-packages/lua-maxminddb
rm -rf package/openwrt-packages/luci-app-vssr

####================= customize import plugins =================############
#### vssr
git clone https://github.com/jerrykuku/lua-maxminddb.git  package/lua-maxminddb
git clone https://github.com/jerrykuku/luci-app-vssr.git  package/luci-app-vssr
#### hello world
git clone https://github.com/fw876/helloworld package/helloworld
### serverchan WX
git clone https://github.com/tty228/luci-app-serverchan package/luci-app-serverchan
### serverchan pushbot
git clone https://github.com/zzsj0928/luci-app-pushbot package/luci-app-pushbot
### jd-dailybonus
git cllone https://github.com/jerrykuku/luci-app-jd-dailybonus package/luci-app-jd-dailybonus

#### add theme
#git clone https://github.com/openwrt-develop/luci-theme-atmaterial package/luci-theme-atmaterial
#git clone https://github.com/apollo-ng/luci-theme-darkmatter.git

#### update and install feeds
./scripts/feeds update -a
./scripts/feeds install
