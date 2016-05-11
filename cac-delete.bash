#!/bin/bash
source cac-config.bash
url="https://panel.cloudatcost.com/api/v1/"
select server in $(cac-list.bash | grep -v listservers | sed -e 's/"sid":"//g' -e 's/".*label":"/-name:/g' -e 's/".*//g')
do
echo "You chose $server"
break
done
uri="cloudpro/delete.php"
sid="$(echo ${server%-*})"
curl -s -k --data "key=${key}&login=${login}&sid=${sid}" "${url}${uri}"
