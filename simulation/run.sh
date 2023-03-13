
# remove current list of bootstrap nodes
> bootstrap_nodes.log
> bootstrap_nodes.sh

# # compose docker network and services and retrieve list of bootstrap nodes
docker compose down
docker compose up -d
sleep 10

# nodes created wait for bootstrap nodes to get activated
nodes=`cat bootstrap_nodes.log`

# set the delimiter to comma
IFS='"'

# read the string into an array
nodes=($(printf "%s" "$nodes"))

# loop through the array and print each fruit
for i in "${!nodes[@]}"
do
    if ((($i+1) % 4 == 0)); then
        I=`expr $i + 1`
        I_4=`expr $I / 4`
        BOOT_PORT=`expr $I_4 + 4001`
        echo "ipfs bootstrap add \"/ip4/0.0.0.0/tcp/${BOOT_PORT}/ipfs/${nodes[$i]}\"" >> bootstrap_nodes.sh
    fi
done

sleep 60

docker exec ipfs-bootstrap1 /bin/sh /simulation/bootstrap_nodes.sh
docker exec ipfs-bootstrap2 /bin/sh /simulation/bootstrap_nodes.sh
docker exec ipfs-bootstrap3 /bin/sh /simulation/bootstrap_nodes.sh
docker exec ipfs-client-webui /bin/sh /simulation/bootstrap_nodes.sh
docker exec ipfs-client1 /bin/sh /simulation/bootstrap_nodes.sh
docker exec ipfs-client2 /bin/sh /simulation/bootstrap_nodes.sh
docker exec ipfs-client3 /bin/sh /simulation/bootstrap_nodes.sh
