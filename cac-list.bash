#!/bin/bash
url="https://panel.cloudatcost.com/api/v1/"
uri="listservers.php"
key="APIKEYFROMWEBSITEGOESHERE"
login="YOUREMAIL@ADDRESS.COMGOESHERE"
curl -s -k "${url}${uri}?key=${key}&login=${login}" | sed -e 's/{/\n/g' -e 's/\}//g'
