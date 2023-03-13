#!/bin/bash

mkdir -p "./data/received"

# create big files and add to ipfs from different clients
dd if=/dev/urandom of=./data/bigfile0.txt bs=1024 count=32768
# dd if=/dev/urandom of=./data/bigfile1.txt bs=1024 count=1048576
# dd if=/dev/urandom of=./data/bigfile2.txt bs=1024 count=2048576
# dd if=/dev/urandom of=./data/bigfile3.txt bs=1024 count=3048576
# dd if=/dev/urandom of=./data/bigfile4.txt bs=1024 count=4048576
# dd if=/dev/urandom of=./data/bigfile5.txt bs=1024 count=5048576

# upload files and get CD hash
UP_OUTPUT=`docker exec ipfs-client-webui ipfs add /simulation/data/bigfile0.txt`
array_CD=()
IFS=' '
# read the output into an array
output=($(printf "%s" "$UP_OUTPUT"))
# loop through the array and print each fruit
for i in "${!output[@]}"
do
    if (($i == 1)); then
        array_CD+=("${output[$i]}")
    fi
done
echo "change_file_hash" >> ./data/bigfile0.txt

# download these files from different clients
docker exec ipfs-client ipfs get ${array_CD[0]} -o /simulation/data/received/${array_CD[0]}

