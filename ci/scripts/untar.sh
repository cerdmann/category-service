#!/usr/bin/env bash

set -e

cp git-repo/manifest.yml artifact/manifest.yml

tar -xvzf gh-release/category-service.*.tar.gz -C artifact 

echo "----------------------------------------------"
ls -lah artifact 
echo "----------------------------------------------"
