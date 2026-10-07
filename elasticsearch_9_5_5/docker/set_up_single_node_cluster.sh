#!/bin/bash

echo "Start a single-node cluster."

echo "Step 1. Create a docker network"
docker network create elastic

echo "Step 2. Pull the Elasticsearch Docker image"
docker pull docker.elastic.co/elasticsearch/elasticsearch:9.5.5

echo "Step 3. Start the Elasticsearch container"
docker run --name es01 --net elastic -p 9200:9200 -it -m 1GB docker.elastic.co/elasticsearch/elasticsearch:9.5.5

echo "To test Machine learning features, we need more memory so we can use an alternative command"
# docker run --name es01 --net elastic -p 9200:9200 -it -m 6GB -e "xpack.ml.use_auto_machine_memory_percent=true" docker.elastic.co/elasticsearch/elasticsearch:9.5.5

