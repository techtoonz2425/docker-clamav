#!/bin/bash

docker push viloge6407/clamav:buster-slim-amd64
docker push viloge6407/clamav:buster-slim-armv7
docker push viloge6407/clamav:buster-slim-arm64v8

docker push viloge6407/clamav:stretch-slim-amd64
#docker push mkodockx/docker-clamav:stretch-slim-armv7
docker push viloge6407/clamav:stretch-slim-arm64v8

docker push viloge6407/clamav:alpine-amd64
docker push viloge6407/clamav:alpine-armv7
docker push viloge6407/clamav:alpine-arm64v8

docker push viloge6407/clamav:alpine-idb-amd64
docker push viloge6407/clamav:alpine-idb-armv7
docker push viloge6407/clamav:alpine-idb-arm64v8

docker push viloge6407/clamav:alpine-edge-amd64
docker push viloge6407/clamav:alpine-edge-armv7
docker push viloge6407/clamav:alpine-edge-arm64v8

echo "Push to docker registry finished."
