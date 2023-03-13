#!/bin/bash

for folder in ls *ipfs-bootstrap*; do
    rm -rf $folder
done

rm -rf ./ipfs-client
rm -rf ./ipfs-client-webui
