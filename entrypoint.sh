#!/bin/sh -l

export NPM_AUTH_TOKEN_BASE64=`echo ${NPM_USERNAME}:${NPM_AUTH_TOKEN}|base64`
cat /templates/.npmrc | envsubst > .npmrc 

# npm version patch --force -m "Auto increase version"

ls -la
# npm config ls
# npm config ls -l

echo "*** env ***"
env

echo "*** npmrc file ***"
cat .npmrc 

echo "******************"
echo "*** PUBLISHING"
echo "******************"
cd ./dist
npm publish --access public