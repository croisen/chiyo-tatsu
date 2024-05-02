#!/bin/sh

# For my debugging purposes - Croi

if [ -z $1 ]; then
    exit
fi

for compiledLib in $(dirname $(realpath $0))/libs_lin/64/lib/*.a; do
    res=$(objdump -d "$compiledLib" | grep -i "$1")
    if [ -n "$res" ]; then
        echo "$compiledLib"
        echo "Byte count: " "$res" | wc -c
    fi
done
