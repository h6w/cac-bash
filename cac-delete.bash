#!/bin/bash
source cac-config.bash
select server in $(cac-list.bash | grep -v listservers | sed -e 's/"sid":"//g' -e 's/".*label":"/-name:/g' -e 's/".*//g')
do
echo "You chose $server"
break
done
sid="$(echo ${server%-*})"
curl -s -k --data "key=${key}&login=${login}&sid=${sid}" "${url}${uri[delete]}"
