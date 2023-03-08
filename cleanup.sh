#!/bin/bash

for folder in ls *ipfs-host*; do
    rm -rf $folder
done

for i in {1..3}; do
    mkdir -p ./ipfs-host$i/data
    mkdir -p ./ipfs-host$i/export
    cp ./swarm.key ./ipfs-host$i/export/swarm.key
done

echo "hello world" > ./ipfs-host1/export/hello
