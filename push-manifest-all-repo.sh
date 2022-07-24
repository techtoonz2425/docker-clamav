#!/bin/bash
if [ -z ${1} ] ; then
  echo "Repository not set. Provide a repository name in the format 'repo/'"
  exit 1
fi
if [ -z ${2} ] ; then
  echo "Username not set. Provide a docker registry username in the format 'sampleName'"
  exit 1
fi
if [ -z ${3} ] ; then
  echo "Password not set. Provide the docker registry password in the format 'p455w0rd'. You may need to escape special characters."
  exit 1
fi

repo=viloge6407/clamav
username=${2}
password=${3}

if ! test -f manifest-tool ; then
  echo Ensure compatible version of manifest tool https://github.com/estesp/manifest-tool
  curl -Lo manifest-tool https://github.com/estesp/manifest-tool/releases/download/v1.0.3/manifest-tool-linux-amd64
  chmod +x manifest-tool
fi

./manifest-tool --username ${username} --password ${password} push from-args \
    --platforms linux/amd64,linux/arm/v7,linux/arm64/v8 \
    --template ${repo}:buster-slim-ARCHVARIANT \
    --target ${repo}:buster-slim

./manifest-tool --username ${username} --password ${password} push from-args \
    --platforms linux/amd64,linux/arm/v7,linux/arm64/v8 \
    --template ${repo}:buster-slim-ARCHVARIANT \
    --target ${repo}:latest
    
./manifest-tool --username ${username} --password ${password} push from-args \
    --platforms linux/amd64,linux/arm64/v8 \
    --template ${repo}:stretch-slim-ARCHVARIANT \
    --target ${repo}:stretch-slim

./manifest-tool --username ${username} --password ${password} push from-args \
    --platforms linux/amd64,linux/arm/v7,linux/arm64/v8 \
    --template ${repo}:alpine-ARCHVARIANT \
    --target ${repo}:alpine

./manifest-tool --username ${username} --password ${password} push from-args \
    --platforms linux/amd64,linux/arm/v7,linux/arm64/v8 \
    --template ${repo}:alpine-edge-ARCHVARIANT \
    --target ${repo}:alpine-edge

echo "Manifest-Push to docker registry finished."
