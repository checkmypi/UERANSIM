#!/bin/bash

[ ! -d /dev/net ] && mkdir /dev/net
[ ! -f /dev/net/tun ] && mknod /dev/net/tun c 10 200

export IP_ADDR=$(awk 'END{print $1}' /etc/hosts)
echo "GNB IP :${IP_ADDR}"
echo "CORE IP :${CORE_IP}"

sed -i -e "s/GNB_IP/${IP_ADDR}/g" /UERANSIM/custom-gnb.yaml
sed -i -e "s/CORE_IP/${CORE_IP}/g" /UERANSIM/custom-gnb.yaml

echo "Start GNB"
/UERANSIM/nr-gnb -c /UERANSIM/custom-gnb.yaml
