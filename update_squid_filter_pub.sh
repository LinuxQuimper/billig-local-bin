#!/bin/sh
wget 'http://pgl.yoyo.org/adservers/serverlist.php?hostformat=squid-dstdom-regex&showintro=1&startdate[day]=&startdate[month]=&startdate[year]=&mimetype=plaintext' -O /tmp/squid_filter_pub
cat /usr/share/squid3/filter_pub /tmp/squid_filter_pub | sort | uniq | grep -v mnstat > /usr/share/squid3/filter_pub
#mv adservers.new adservers.reg
rm /tmp/squid_filter_pub
service squid3 restart
