#!/bin/sh

eval $(ssh-agent -s)
ssh-add <(echo "$SSH_PRIVATE_KEY")
mkdir -p ~/.ssh
echo -e "Host *\n\tStrictHostKeyChecking no\n\n" > ~/.ssh/config

git clone $ORIGIN_REPO repo
cd repo
git remote add upstream $UPSTREAM_REPO
git push upstream master
cd .. && rm -rf repo
