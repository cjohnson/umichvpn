#!/bin/sh

show_usage() {
  echo "umichvpn - A simple CLI frontend for the University of Michigan VPN."
  echo ""
  echo "Usage:"
  echo "umichvpn connect - Connect to the VPN"
  echo "umichvpn disconnect - Disconnect from the VPN"
  echo "umichvpn status - Status of the VPN connection"
  echo ""
}

if [ "$#" -ne 1 ]; then
  show_usage
  exit 1
fi

case "$1" in
  connect)
    /opt/cisco/anyconnect/bin/vpn connect umvpn.umnet.umich.edu/umvpn-all-traffic-alt
    exit_status=$?
    ;;
  disconnect)
    /opt/cisco/anyconnect/bin/vpn disconnect
    exit_status=$?
    ;;
  status)
    /opt/cisco/anyconnect/bin/vpn status
    exit_status=$?
    ;;
  *)
    show_usage
    exit 1
    ;;
esac

exit $exit_status
