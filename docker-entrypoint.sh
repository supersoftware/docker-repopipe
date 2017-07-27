#!/bin/sh

mkdir -p ~/.ssh
echo $SSH_PRIVATE_KEY > ~/.ssh/id_rsa
chmod 600 ~/.ssh/id_rsa
echo -e "Host *\n\tStrictHostKeyChecking no\n\n" > ~/.ssh/config
eval $(ssh-agent -s)
ssh-add

git clone $ORIGIN_REPO repo
cd repo
git remote add upstream $UPSTREAM_REPO
git push upstream master
cd .. && rm -rf repo

ssh-add -D
