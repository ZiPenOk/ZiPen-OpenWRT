#!/bin/bash
#=============================================================
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part1.sh
# Description: OpenWrt DIY script part 1 (Before Update feeds)
# Lisence: MIT
# Author: P3TERX
# Blog: https://p3terx.com
#=============================================================
# git clone https://github.com/firker/neihe.git

# mv -f neihe/Makefile ./target/linux/x86/Makefile
# sed -i 's/KERNEL_PATCHVER:=5.10/KERNEL_PATCHVER:=5.4/g' ./target/linux/x86/Makefile
# sed -i 's/KERNEL_PATCHVER:=5.15/KERNEL_PATCHVER:=5.4/g' ./target/linux/x86/Makefile
# sed -i 's/KERNEL_TESTING_PATCHVER:=5.10/KERNEL_TESTING_PATCHVER:=5.4/g' ./target/linux/x86/Makefile

# Uncomment a feed source
# sed -i 's/^#\(.*helloworld\)/\1/' feeds.conf.default
# Add a feed source
echo 'src-git jerryk https://github.com/jerrykuku/openwrt-package' >>feeds.conf.default

git clone https://github.com/fw876/helloworld.git package/ssr
git clone https://github.com/firker/diy-ziyong.git package/diy-ziyong
git clone https://github.com/xiaorouji/openwrt-passwall package/openwrt-passwall
git clone -b luci https://github.com/xiaorouji/openwrt-passwall package/passwall
# sed -i '$a src-git bypass https://github.com/garypang13/openwrt-bypass' feeds.conf.default
# git clone -b master https://github.com/vernesong/OpenClash.git package/OpenClash
svn co https://github.com/vernesong/OpenClash/trunk/luci-app-openclash package/luci-app-openclash
git clone https://github.com/firker/diy-ziyong.git package/diy-ziyong
git clone -b 18.06 https://github.com/garypang13/luci-theme-edge.git package/luci-theme-edge
git clone https://github.com/thinktip/luci-theme-neobird.git package/luci-theme-neobird
git clone https://github.com/tty228/luci-app-serverchan.git package/luci-app-serverchan
git clone https://github.com/sirpdboy/luci-theme-opentopd.git package/luci-theme-opentopd
git clone https://github.com/QiuSimons/openwrt-mos.git package/openwrt-mos
git clone https://github.com/sbwml/openwrt-alist.git package/openwrt-alist
# svn co https://github.com/kiddin9/openwrt-packages/trunk/adguardhome package/adguardhome
svn co https://github.com/messense/aliyundrive-webdav/trunk/openwrt package/aliyundrive-webdav
# git clone https://github.com/linkease/istore.git package/istore
# sed -i 's/luci-lib-ipkg/luci-base/g' package/istore/luci/luci-app-store/Makefile
# git clone https://github.com/linkease/istore-ui.git package/istore-ui
# git clone https://github.com/garypang13/luci-app-dnsfilter.git package/luci-app-dnsfilter
# git clone https://github.com/godros/luci-app-godproxy.git package/luci-app-godproxy
# git clone https://github.com/BCYDTZ/luci-app-UUGameAcc.git package/luci-app-UUGameAcc
