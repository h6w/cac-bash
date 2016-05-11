#!/bin/bash
source cac-config.bash
url="https://panel.cloudatcost.com/api/v1/"
uri="cloudpro/resources.php"
mapfile -t stats < <(curl -s -k "${url}${uri}?key=${key}&login=${login}" | sed -e 's/{/\n/g' -e 's/\}//g' | grep -i cpu)
totcpu=$(echo "${stats[0]}" | cut -d\" -f4)
totram=$(echo "${stats[0]}" | cut -d\" -f8)
totdisk=$(echo "${stats[0]}" | cut -d\" -f12)
uscpu=$(echo "${stats[1]}" | cut -d\" -f4)
usram=$(echo "${stats[1]}" | cut -d\" -f8)
usdisk=$(echo "${stats[1]}" | cut -d\" -f12)
uri="cloudpro/build.php"
read -p "cpu, $(echo $totcpu - $uscpu | bc) available: " cpu
read -p "ram, $(echo $totram - $usram | bc) available: " ram
read -p "storage, $(echo $totdisk - $usdisk | bc) available: " storage
os=27  #This sets it to ubuntu, use cac-templates.bash for list.
curl -s -k --data "key=${key}&login=${login}&cpu=${cpu}&ram=${ram}&storage=${storage}&os=${os}" "${url}${uri}"
