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
#### passwall depend
git clone https://github.com/kenzok8/small package/small
### serverchan WX
git clone https://github.com/tty228/luci-app-serverchan package/luci-app-serverchan
### serverchan dingTalk
git clone https://github.com/zzsj0928/luci-app-serverchand package/luci-app-serverchand
#### add theme
#git clone https://github.com/openwrt-develop/luci-theme-atmaterial package/luci-theme-atmaterial
#git clone https://github.com/apollo-ng/luci-theme-darkmatter.git

### fix shadowsocksr-libev which does not exist
#find package/*/ feeds/*/ -maxdepth 2 -path "*luci-app-bypass/Makefile" | xargs -i sed -i 's/shadowsocksr-libev-ssr-redir/shadowsocksr-libev-alt/g' {}
#find package/*/ feeds/*/ -maxdepth 2 -path "*luci-app-bypass/Makefile" | xargs -i sed -i 's/shadowsocksr-libev-ssr-server/shadowsocksr-libev-server/g' {}

#### update and install feeds
./scripts/feeds update -a
./scripts/feeds install
