#!/bin/bash
source cac-config.bash
url="https://panel.cloudatcost.com/api/v1/"
uri="listtemplates.php"
curl -s -k "${url}${uri}?key=${key}&login=${login}" | sed -e 's/{/\n/g' -e 's/\}//g'
