#!/bin/bash
#=============================================================
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part1.sh
# Description: OpenWrt DIY script part 1 (Before Update feeds)
# Lisence: MIT
# Author: P3TERX
# Blog: https://p3terx.com
#=============================================================

# Uncomment a feed source
#sed -i 's/^#\(.*helloworld\)/\1/' feeds.conf.default
sed -i 's/KERNEL_PATCHVER:=6.6/KERNEL_PATCHVER:=6.12/g' ./target/linux/x86/Makefile
sed -i 's/KERNEL_PATCHVER:=5.15/KERNEL_PATCHVER:=6.6/g' ./target/linux/x86/Makefile
# sed -i '/luci/d' feeds.conf.default
# echo 'src-git luci https://github.com/coolsnowwolf/luci.git;openwrt-23.05' >>feeds.conf.default
# sed -i '2i src-git luci https://github.com/coolsnowwolf/luci.git;openwrt-23.05' feeds.conf.default

# Add a feed source
function merge_package(){
    repo=`echo $1 | rev | cut -d'/' -f 1 | rev`
    pkg=`echo $2 | rev | cut -d'/' -f 1 | rev`
    # find package/ -follow -name $pkg -not -path "package/custom/*" | xargs -rt rm -rf
    git clone --depth=1 --single-branch $1
    mv $2 package/custom/
    rm -rf $repo
}
function drop_package(){
    find package/ -follow -name $1 -not -path "package/custom/*" | xargs -rt rm -rf
}

rm -rf package/custom; mkdir package/custom

# git clone https://github.com/fw876/helloworld.git package/ssr
git clone https://github.com/firker/diy-ziyong -b 2305 package/diy-ziyong
# merge_package https://github.com/firker/diy-ziyong diy-ziyong/wrtbwmon
git clone https://github.com/jerrykuku/luci-theme-argon.git  package/luci-theme-argon
git clone https://github.com/jerrykuku/luci-app-argon-config.git  package/luci-app-argon-config
git clone -b js https://github.com/sirpdboy/luci-theme-kucat.git  package/luci-theme-kucat
# find ./ | grep Makefile | grep mosdns | xargs rm -f
# git clone https://github.com/firkerword/openwrt-mos.git package/openwrt-mos
# git clone https://github.com/QiuSimons/openwrt-mos.git package/openwrt-mos
# find ./ | grep Makefile | grep v2ray-geodata | xargs rm -f
git clone https://github.com/xiaorouji/openwrt-passwall-packages.git package/openwrt-passwall
git clone https://github.com/xiaorouji/openwrt-passwall.git package/passwall
# git clone -b luci-smartdns-new-version https://github.com/xiaorouji/openwrt-passwall.git package/passwall
# git clone https://github.com/firkerword/luci-app-mosdns.git package/mosdns
# git clone https://github.com/xiaorouji/openwrt-passwall2.git package/passwall2
find ./ | grep Makefile | grep v2ray-geodata | xargs rm -f
find ./ | grep Makefile | grep mosdns | xargs rm -f
git clone https://github.com/sbwml/luci-app-mosdns.git package/mosdns
git clone https://github.com/sbwml/v2ray-geodata package/v2ray-geodata
git clone https://github.com/tty228/luci-app-wechatpush.git package/luci-app-serverchan
git clone https://github.com/firkerword/luci-app-lucky.git package/lucky
# git clone https://github.com/sirpdboy/luci-app-lucky.git package/lucky
chmod 755 ./package/lucky/luci-app-lucky/root/usr/bin/luckyarch
git clone https://github.com/linkease/nas-packages-luci.git package/nas-packages-luci
git clone https://github.com/linkease/nas-packages.git package/nas-packages
git clone https://github.com/linkease/istore.git package/istore
# sed -i 's/luci-lib-ipkg/luci-base/g' package/istore/luci/luci-app-store/Makefile

