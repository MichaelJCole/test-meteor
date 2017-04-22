#!/bin/bash

echo $(node -p -e "require('./package.json').version")-$(git rev-parse --short HEAD)
