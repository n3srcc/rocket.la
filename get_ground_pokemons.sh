#!/bin/bash

POKE_API="https://pokeapi.co/api/v2/type/5/"

curl -sS "https://pokeapi.co/api/v2/type/5/"  | sed -rn 's/{"name":"([a-z]+)","url":"(https?:\/\/[\w\/\]+\.]+)"},"slot":(2)}/urlss\1/g'

#| grep -Po '{"name":"([a-z]+)","url":"(https?:\/\/[\w\/\]+\.]+)"},"slot":(2)}'
#curl -sS "$POKE_API" | jq -r '.name'
#echo "word1 word2 word3" | sed 's/\(w.*1\)\(.*\)/Q\1Q\2/'

#REGEXP FOR ENV DEPLOYMENT YAML
#(env:)?\s+(- name):\s([\w]+)

#WORKS: (sed -nr 's/(- name):(.*)/\2/p' mysql-deployment.yaml)
#https://likegeeks.com/es/comando-awk/
#https://likegeeks.com/es/sed-de-linux/#Banderas_de_Substitucion
#https://loige.co/extracting-data-from-wikipedia-using-curl-grep-cut-and-other-bash-commands/#extracting-data-with-grep