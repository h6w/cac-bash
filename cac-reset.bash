#!/bin/bash
source cac-config.bash
url="https://panel.cloudatcost.com/api/v1/"
uri="powerop.php"
sid=""
ansuser=""
domain=""
while true
do
   if ansible "$domain" -m ping -u "$ansuser" &>/dev/null
   then
      echo "$domain looks up from here, doing nothing."
      sleep 3600
   else
      echo "$domain appears to be down, trying to reset."
      if curl -s -o /dev/null -k --data "key=${key}&login=${login}&sid=${sid}&action=reset" "${url}${uri}"
      then
         echo "Reset appears to have worked, waiting 5 minutes."
         sleep 300
      else
         echo "All is fucked."
         sleep 300
      fi
   fi
done
