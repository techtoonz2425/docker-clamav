#!/bin/bash
if [ -z ${1} ] ; then
  echo "Username not set. Provide a docker registry username in the format 'sampleName'"
  exit 1
fi
if [ -z ${2} ] ; then
  echo "Password not set. Provide the docker registry password in the format 'p455w0rd'. You may need to escape special characters."
  exit 1
fi

username=${2}
password=${3}

if ! test -f manifest-tool ; then
  echo Ensure compatible version of manifest tool https://github.com/estesp/manifest-tool
  curl -Lo manifest-tool https://github.com/estesp/manifest-tool/releases/download/v1.0.3/manifest-tool-linux-amd64
  chmod +x manifest-tool
fi

./manifest-tool --username ${username} --password ${password} push from-args \
    --platforms linux/amd64,linux/arm/v7,linux/arm64/v8 \
    --template viloge6407/clamav:buster-slim-ARCHVARIANT \
    --target viloge6407/clamav:buster-slim

./manifest-tool --username ${username} --password ${password} push from-args \
    --platforms linux/amd64,linux/arm/v7,linux/arm64/v8 \
    --template viloge6407/clamav:buster-slim-ARCHVARIANT \
    --target viloge6407/clamav:latest
    
./manifest-tool --username ${username} --password ${password} push from-args \
    --platforms linux/amd64,linux/arm64/v8 \
    --template viloge6407/clamav:stretch-slim-ARCHVARIANT \
    --target viloge6407/clamav:stretch-slim

./manifest-tool --username ${username} --password ${password} push from-args \
    --platforms linux/amd64,linux/arm/v7,linux/arm64/v8 \
    --template viloge6407/clamav:alpine-ARCHVARIANT \
    --target viloge6407/clamav:alpine

./manifest-tool --username ${username} --password ${password} push from-args \
    --platforms linux/amd64,linux/arm/v7,linux/arm64/v8 \
    --template viloge6407/clamav:alpine-idb-ARCHVARIANT \
    --target viloge6407/clamav:alpine-idb

./manifest-tool --username ${username} --password ${password} push from-args \
    --platforms linux/amd64,linux/arm/v7,linux/arm64/v8 \
    --template viloge6407/clamav:alpine-edge-ARCHVARIANT \
    --target viloge6407/clamav:alpine-edge

echo "Manifest-Push to docker registry finished."
