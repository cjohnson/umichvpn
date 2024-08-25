#!/bin/sh

UMICHVPN_ARTIFACT_FILE_NAME=UMVPN-linux.tar.gz
UMICHVPN_ARTIFACT_URL=https://www.dropbox.com/s/d2zysaq0e2sr6e7/UMVPN-linux.tar.gz?dl=1
UMICHVPN_ARTIFACTS_DIR=artifacts

echo "umichvpn_installer: Creating artifacts directory if it doesn't exist..."
mkdir -p $UMICHVPN_ARTIFACTS_DIR
cd $UMICHVPN_ARTIFACTS_DIR

echo "umichvpn_installer: Fetching UMich ITS Archive from Dropbox..."
curl -L $UMICHVPN_ARTIFACT_URL -o $UMICHVPN_ARTIFACT_FILE_NAME

echo "umichvpn_installer: Extracting Tarball..."
tar zxvf $UMICHVPN_ARTIFACT_FILE_NAME

echo "umichvpn_installer: (Requires elevated privileges) Installing VPN..."
sudo ./anyconnect-linux/vpn/vpn_install.sh

echo "umichvpn_installer: Done!"

