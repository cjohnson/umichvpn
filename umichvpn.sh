#!/bin/sh

show_usage() {
  echo "Usage: umichvpn <connect/disconnect>"
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
  *)
    show_usage
    exit 1
    ;;
esac

exit $exit_status
