#!/bin/sh

set -e

ln -s $CA_CERT /usr/local/share/ca-certificates/ca.crt
update-ca-certificates

git clone $(cat $ORIGIN_REPO) repo
cd repo
git remote add upstream $(cat $UPSTREAM_REPO)
git push upstream master
cd .. && rm -rf repo
