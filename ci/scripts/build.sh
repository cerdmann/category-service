#!/usr/bin/env bash

set -e

echo "=============================================="
echo "Beginning build of dotnet core web application"
echo "dotnet core cli version $(dotnet --version)"
echo "=============================================="

cd git-repo

dotnet restore

dotnet publish -c release -r ubuntu.14.04-x64

COMMIT=$(git rev-parse HEAD)
ARTIFACT_NAME=category-service.$COMMIT.tar.gz

echo $ARTIFACT_NAME > ../artifact/release_name.txt
echo $(git log --format=%B -n 1 $COMMIT) > ../artifact/release_notes.md
echo $COMMIT > ../artifact/release_commitish.txt
echo ci-release > ../artifact/release_tag.txt

tar -czvf ../artifact/$ARTIFACT_NAME ./bin/release/netcoreapp1.1/publish

echo "----------------------------------------------"
echo "Build Complete"
ls -lah ../artifact
echo "----------------------------------------------"
