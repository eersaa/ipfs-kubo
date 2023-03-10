#!/bin/bash

mkdir -p "./data/received"
mkdir -p "./data/received/client1"
mkdir -p "./data/received/client2"
mkdir -p "./data/received/client3"
mkdir -p "./data/received/client-webui"
mkdir -p "./data/received/bootstrap1"
mkdir -p "./data/received/bootstrap2"
mkdir -p "./data/received/bootstrap3"

# create big files and add to ipfs from different clients
dd if=/dev/urandom of=./data/bigfile0.txt bs=1024 count=65536
dd if=/dev/urandom of=./data/bigfile1.txt bs=1024 count=131072
dd if=/dev/urandom of=./data/bigfile2.txt bs=1024 count=262144
dd if=/dev/urandom of=./data/bigfile3.txt bs=1024 count=524288
dd if=/dev/urandom of=./data/bigfile4.txt bs=1024 count=1048576

# upload files and get CD hash
UP_OUTPUT1=`docker exec ipfs-client1 ipfs add /simulation/data/bigfile0.txt`
UP_OUTPUT2=`docker exec ipfs-client1 ipfs add /simulation/data/bigfile1.txt`
UP_OUTPUT3=`docker exec ipfs-client2 ipfs add /simulation/data/bigfile2.txt`
UP_OUTPUT4=`docker exec ipfs-client2 ipfs add /simulation/data/bigfile3.txt`
UP_OUTPUT5=`docker exec ipfs-client3 ipfs add /simulation/data/bigfile4.txt`
# echo -e "\nAdded file to ipfs private network from client1"

array_CD=()
IFS=' '
# read the output into an array
output=($(printf "%s" "$UP_OUTPUT1"))
# loop through the array
for i in "${!output[@]}"
do
    if (($i == 1)); then
        array_CD+=("${output[$i]}")
    fi
done
echo "change_file_hash" >> ./data/bigfile0.txt

# read the output into an array
output=($(printf "%s" "$UP_OUTPUT2"))
# loop through the array
for i in "${!output[@]}"
do
    if (($i == 1)); then
        array_CD+=("${output[$i]}")
    fi
done
echo "change_file_hash" >> ./data/bigfile1.txt

# read the output into an array
output=($(printf "%s" "$UP_OUTPUT3"))
# loop through the array
for i in "${!output[@]}"
do
    if (($i == 1)); then
        array_CD+=("${output[$i]}")
    fi
done
echo "change_file_hash" >> ./data/bigfile2.txt

# read the output into an array
output=($(printf "%s" "$UP_OUTPUT4"))
# loop through the array
for i in "${!output[@]}"
do
    if (($i == 1)); then
        array_CD+=("${output[$i]}")
    fi
done
echo "change_file_hash" >> ./data/bigfile3.txt

# read the output into an array
output=($(printf "%s" "$UP_OUTPUT5"))
# loop through the array
for i in "${!output[@]}"
do
    if (($i == 1)); then
        array_CD+=("${output[$i]}")
    fi
done
echo "change_file_hash" >> ./data/bigfile4.txt

# download files to each client so atleast 2 nodes have the files
echo -e "\n Set1"

docker exec ipfs-client2 ipfs get ${array_CD[0]} -o /simulation/data/received/client2/${array_CD[0]}
docker exec ipfs-client3 ipfs get ${array_CD[0]} -o /simulation/data/received/client3/${array_CD[0]}
docker exec ipfs-client-webui ipfs get ${array_CD[0]} -o /simulation/data/received/client-webui/${array_CD[0]}

echo -e "\n Set2"

docker exec ipfs-client2 ipfs get ${array_CD[1]} -o /simulation/data/received/client2/${array_CD[1]}
docker exec ipfs-client3 ipfs get ${array_CD[1]} -o /simulation/data/received/client3/${array_CD[1]}
docker exec ipfs-client-webui ipfs get ${array_CD[1]} -o /simulation/data/received/client-webui/${array_CD[1]}

echo -e "\n Set3"

docker exec ipfs-client1 ipfs get ${array_CD[2]} -o /simulation/data/received/client1/${array_CD[2]}
docker exec ipfs-client3 ipfs get ${array_CD[2]} -o /simulation/data/received/client3/${array_CD[2]}
docker exec ipfs-client-webui ipfs get ${array_CD[2]} -o /simulation/data/received/client-webui/${array_CD[2]}

echo -e "\n Set4"

docker exec ipfs-client1 ipfs get ${array_CD[3]} -o /simulation/data/received/client1/${array_CD[3]}
docker exec ipfs-client3 ipfs get ${array_CD[3]} -o /simulation/data/received/client3/${array_CD[3]}
docker exec ipfs-bootstrap1 ipfs get ${array_CD[3]} -o /simulation/data/received/bootstrap1/${array_CD[3]}
docker exec ipfs-client-webui ipfs get ${array_CD[3]} -o /simulation/data/received/client-webui/${array_CD[3]}

echo -e "\n Set5"

docker exec ipfs-client1 ipfs get ${array_CD[4]} -o /simulation/data/received/client1/${array_CD[4]}
docker exec ipfs-client2 ipfs get ${array_CD[4]} -o /simulation/data/received/client2/${array_CD[4]}
docker exec ipfs-bootstrap1 ipfs get ${array_CD[4]} -o /simulation/data/received/bootstrap1/${array_CD[4]}
docker exec ipfs-bootstrap2 ipfs get ${array_CD[4]} -o /simulation/data/received/bootstrap2/${array_CD[4]}
docker exec ipfs-client-webui ipfs get ${array_CD[4]} -o /simulation/data/received/client-webui/${array_CD[4]}

