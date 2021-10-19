#!/usr/bin/env bash

########
# This script build the Jitsi library with LIBRE_BUILD flag.
# Following instructions from here https://github.com/jitsi/jitsi-meet/tree/master/android#build-and-use-your-own-sdk-artifactsbinaries
# It then export the library in a maven repository, that we host here https://github.com/vector-im/jitsi_libre_maven

# exit on any error
set -e

echo
echo "##################################################"
echo "Cloning jitsi-meet repository"
echo "##################################################"

cd ..
rm -rf jitsi-meet
git clone https://github.com/jitsi/jitsi-meet

cd jitsi-meet

# https://github.com/jitsi/jitsi-meet/releases/tag/android-sdk-3.6.0
git checkout f84f7332b9205652a7e9cd8772d05c6fd98e0329

# We want a libre build!
export LIBRE_BUILD=true

echo
echo "##################################################"
echo "npm install"
echo "##################################################"

npm install

./android/scripts/release-sdk.sh /tmp/repo/

echo
echo "##################################################"
echo "Release has been done here: /tmp/repo/"
echo "##################################################"
