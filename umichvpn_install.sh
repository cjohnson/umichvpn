#!/bin/sh

# Gets the directory name of the script no matter where it is called from.
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
cd $SCRIPT_DIR

mkdir -p artifacts
cd artifacts

echo "umichvpn_installer: Fetching ITS Archive..."
echo

# -L flag added to follow the dropbox redirect.
curl -L -o UMVPN-linux.tar.gz https://www.dropbox.com/s/d2zysaq0e2sr6e7/UMVPN-linux.tar.gz?dl=1

echo
echo "umichvpn_installer: Extracting Tarball..."
echo

tar zxvf UMVPN-linux.tar.gz

echo
echo "umichvpn_installer: Installing VPN..."
echo

cd anyconnect-linux/vpn/
sudo ./vpn_install.sh

echo
