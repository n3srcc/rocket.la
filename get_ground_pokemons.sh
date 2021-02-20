#!/bin/bash

POKE_API="https://pokeapi.co/api/v2/type/5/"

curl -sS "$POKE_API"  | sed -rn 's/{"name":"([a-z]+)","url":"(https?:\/\/[\w\/\]+\.]+)"},"slot":(2)}/urlss\1/g'

#| grep -Po '{"name":"([a-z]+)","url":"(https?:\/\/[\w\/\]+\.]+)"},"slot":(2)}'
#curl -sS "$POKE_API" | jq -r '.name'
#echo "word1 word2 word3" | sed 's/\(w.*1\)\(.*\)/Q\1Q\2/'

#REGEXP FOR ENV DEPLOYMENT YAML
#(env:)?\s+(- name):\s([\w]+)
