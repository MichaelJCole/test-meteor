#!/bin/bash
IMG=node:4.6.2
LOCAL=bigsmall/$IMG

# build locally
docker build -t $LOCAL .    || exit
docker push $LOCAL
