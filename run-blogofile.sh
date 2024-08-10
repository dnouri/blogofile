#!/bin/bash

# Define the Docker image name
IMAGE_NAME="blogofile"

# Define the local directory to mount
LOCAL_DIR="$(pwd)"

# Define the container's working directory
CONTAINER_DIR="/app"

# Run the Docker container with volume mounting
docker run --rm -it \
    -v "$LOCAL_DIR:$CONTAINER_DIR" \
    "$IMAGE_NAME" \
    /usr/local/bin/blogofile "$@"
