#!/bin/sh

set -e

git clone `cat $ORIGIN_REPO` repo
cd repo
git remote add upstream `cat $UPSTREAM_REPO`
git push upstream master
cd .. && rm -rf repo
