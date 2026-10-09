#!/bin/bash

DOCKER_NETWORK="elastic"
DOCKER_IMAGE="docker.elastic.co/elasticsearch/elasticsearch:9.5.5"

echo "Start a single-node cluster."

if docker network ps | grep $DOCKER_NETWORK; then
    echo "Network $DOCKER_NETWORK already exists."
else
    echo "Step 1. Create a docker network"
    docker network create $DOCKER_NETWORK
fi

if docker images | grep $DOCKER_IMAGE; then
    echo "The image $DOCKER_IMAGE already exists."
else
    echo "Step 2. Pull the Elasticsearch Docker image"
    docker pull $DOCKER_IMAGE
fi

echo "Step 3. Start the Elasticsearch container"
docker run --name es01 --net elastic -p 9200:9200 -it -m 1GB docker.elastic.co/elasticsearch/elasticsearch:9.5.5

# echo "To test Machine learning features, we need more memory so we can use an alternative command"
# docker run --name es01 --net elastic -p 9200:9200 -it -m 6GB -e "xpack.ml.use_auto_machine_memory_percent=true" docker.elastic.co/elasticsearch/elasticsearch:9.5.5

