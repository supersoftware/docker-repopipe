#!/bin/sh

set -e

git clone $ORIGIN_REPO repo
cd repo
git remote add upstream $UPSTREAM_REPO
git push upstream master
cd .. && rm -rf repo
