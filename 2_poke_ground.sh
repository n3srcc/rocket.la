#!/bin/bash
# Eduardo Mondragon

POKE_API="https://pokeapi.co/api/v2/type/5/"

JSON_FILE="pokeGround.json"
CSV_EXPORTED="api/twoslotgroundpokemons.csv"
curl -sS $POKE_API -o $JSON_FILE && cat $JSON_FILE \
    | grep -Po '{"name":"([a-z]+)","url":"(https?:\/\/[\w\/\]+\.]+)"},"slot":(2)}' \
    | sed -rnE 's/\{"name":"(.*)","url":"(.*)"\},"slot":2}/\1,\2,2/p' > $CSV_EXPORTED && echo "CSV exported $CSV_EXPORTED"
