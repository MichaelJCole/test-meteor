#!/bin/bash

if [ -f "/etc/env-volume/env.sh" ];  then
  echo "Environment volume found"
  source /etc/env-volume/env.sh
else
  echo "WARNING: Environment volume not found"
fi
npm ${1:-start}    
