#!/bin/bash

docker build -t viloge6407/clamav:alpine-idb-amd64-v2021-05-25 -f alpine/main-idb/Dockerfile alpine/main-idb/

docker build -t viloge6407/clamav:alpine-idb-amd64 -f alpine/main-idb/Dockerfile alpine/main-idb/
