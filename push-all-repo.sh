#!/bin/bash
if [ -z ${1} ] ; then
  echo "Repository not set. Provide a repository name in the format 'repo/'"
  exit 1
fi

repo=viloge6407/clamav

docker push ${repo}:buster-slim-amd64
docker push ${repo}:buster-slim-armv7
docker push ${repo}:buster-slim-arm64v8

docker push ${repo}:stretch-slim-amd64
#docker push ${repo}docker-clamav:stretch-slim-armv7
docker push ${repo}:stretch-slim-arm64v8

docker push ${repo}:alpine-amd64
docker push ${repo}:alpine-armv7
docker push ${repo}:alpine-arm64v8

docker push ${repo}:alpine-edge-amd64
docker push ${repo}:alpine-edge-armv7
docker push ${repo}:alpine-edge-arm64v8

echo "Push to docker registry finished."
