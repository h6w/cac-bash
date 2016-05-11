#!/bin/bash
source cac-config.bash
curl -s -k "${url}${uri[templates]}?key=${key}&login=${login}" | sed -e 's/{/\n/g' -e 's/\}//g'
